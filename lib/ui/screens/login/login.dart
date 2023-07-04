import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/image_manager.dart';
import 'package:time_tracker/core/services/fcm_service.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/link_text_span.dart';
import 'package:time_tracker/ui/components/forms/email_form_field.dart';
import 'package:time_tracker/ui/components/forms/pass_word_form_field.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_email/forgot_password_enter_email_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_otp/forgot_password_enter_otp_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/forgot_password/reset_password/reset_password_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/login/auth_bloc_state.dart';
import 'package:time_tracker/ui/screens/login/auth_cubit.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import '../../../l10n/locale_keys.g.dart';
import '../../components/loading_container.dart';
import '../../validations/support_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void _goToSignUpPage(BuildContext context) {
    context.push(AppPage.createAccountSelectRole.toPath);
  }

  void _showForgotPasswordEnterEmailBottomSheet(BuildContext context) {
    final enterEmailBottomSheet = ForgotPasswordEnterEmailBottomSheet(
      onRequestOtpSuccess: (email) =>
          _showForgotPasswordEnterOtpBottomSheet(context, email),
    );
    enterEmailBottomSheet.show(context);
  }

  void _showForgotPasswordEnterOtpBottomSheet(
      BuildContext context, String email) {
    final enterOtpBottomSheet = ForgotPasswordEnterOtpBottomSheet(
      email: email,
      onVerifyOtpSuccess: () => _showResetPasswordBottomSheet(context, email),
    );
    enterOtpBottomSheet.show(context);
  }

  void _showResetPasswordBottomSheet(BuildContext context, String email) {
    final resetPasswordBottomSheet = ResetPasswordBottomSheet(email: email);
    resetPasswordBottomSheet.show(context);
  }

  Future<void> getToken() async {
    final tk = await di.sl<FcmService>().getFcmToken() ?? '';
    di.sl<LocalDataResource>().setFcmRefreshToken(tk);
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthBlocState>(
      listener: (context, state) {
        if (state.loginStatus == AuthStatus.loadFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of<AuthCubit>(context);
        return LoadingContainer(
          isLoading: state.loginStatus == AuthStatus.loading,
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 22.0),
                        Text(
                          LocaleKeys.loginTitle.tr(),
                          style: getHeadline1TextStyle(),
                        ),
                        const SizedBox(height: 105.0),
                        SizedBox.square(
                          dimension: 40.0,
                          child: Image.asset(UiImage.wavingHand),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          LocaleKeys.loginHeader.tr(),
                          style: getBigTextTextStyle(),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  EmailFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: emailController,
                                      onChanged: (value) {},
                                      validator: SupportValidators.compose([
                                        SupportValidators.required(
                                            fieldName:
                                                LocaleKeys.fieldEmail.tr()),
                                      ])),
                                  const SizedBox(height: 16),
                                  PasswordFormField(
                                    controller: passwordController,
                                    onChanged: (value) {},
                                    validator: SupportValidators.compose([
                                      SupportValidators.required(
                                          fieldName:
                                              LocaleKeys.fieldPassword.tr()),
                                    ]),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    child: LinkTextSpan(
                                      textAlign: TextAlign.right,
                                      link: LocaleKeys.loginForgotPassword.tr(),
                                      onTap: () =>
                                          _showForgotPasswordEnterEmailBottomSheet(
                                              context),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Button(
                                      text: LocaleKeys.loginSubmit.tr(),
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          cubit.signIn(emailController.text,
                                              passwordController.text);
                                        }
                                      }),
                                  const SizedBox(height: 20),
                                  LinkTextSpan(
                                    textAlign: TextAlign.center,
                                    link: LocaleKeys.loginSignUpLink.tr(),
                                    prefixText: LocaleKeys.loginSignUp.tr(),
                                    onTap: () => _goToSignUpPage(context),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
