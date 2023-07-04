import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/link_text_span.dart';
import 'package:time_tracker/ui/components/forms/default_form_field.dart';
import 'package:time_tracker/ui/components/forms/email_form_field.dart';
import 'package:time_tracker/ui/components/forms/image_form.dart';
import 'package:time_tracker/ui/components/forms/pass_word_form_field.dart';
import 'package:time_tracker/ui/screens/create_account/enter_information/register_info_cubit.dart';
import 'package:time_tracker/ui/screens/create_account/enter_otp/create_account_enter_otp_bottom_sheet.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import '../../../components/header/header.dart';
import '../../../components/loading_container.dart';
import '../../error/error_handler.dart';
import 'register_info_bloc_state.dart';

class CreateAccountEnterInfoPage extends StatefulWidget {
  const CreateAccountEnterInfoPage({super.key, required this.userRole});

  final UserRole userRole;

  @override
  State<CreateAccountEnterInfoPage> createState() =>
      _CreateAccountEnterInfoPageState();
}

class _CreateAccountEnterInfoPageState
    extends State<CreateAccountEnterInfoPage> {
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  final Map<String, TextEditingController> controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  final confirmPasswordNode = FocusNode();

  void _register({required RegisterInfoCubit cubit, String? avatarUrl}) {
    cubit.register(
      controllers['firstName']?.text ?? '',
      controllers['lastName']?.text ?? '',
      controllers['email']?.text ?? '',
      controllers['password']?.text ?? '',
      avatarUrl,
      widget.userRole.code,
    );
  }

  void _onSignInTapped(BuildContext context) async {
    context.go(AppPage.home.toPath);
  }

  @override
  void dispose() {
    controllers.forEach((_, controller) {
      controller.dispose();
    });
    confirmPasswordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RegisterInfoCubit>(),
      child: BlocConsumer<RegisterInfoCubit, RegisterInfoBlocState>(
        listener: (context, state) {
          RegisterInfoCubit registerInfoCubit =
              BlocProvider.of<RegisterInfoCubit>(context);

          if (state.status == RegisterInfoStatus.registerInfoSuccess) {
            final enterOtpBottomSheet = CreateAccountEnterOtpBottomSheet(
              email: controllers['email']?.text ?? '',
              onVerifyOtpSuccess: () => context.go(AppPage.home.toPath),
            );
            enterOtpBottomSheet.show(context);
          }

          if (state.status == RegisterInfoStatus.unsignedUploadSuccess) {
            _register(
              cubit: registerInfoCubit,
              avatarUrl: state.cloudinaryResponse?.secureUrl,
            );
          }

          if (state.status == RegisterInfoStatus.failure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          RegisterInfoCubit registerInfoCubit =
              BlocProvider.of<RegisterInfoCubit>(context);
          return LoadingContainer(
            isLoading: state.status == RegisterInfoStatus.loading,
            child: Scaffold(
              appBar: Header(
                title: LocaleKeys.createAccountAppBarTitle.tr(),
                backPress: () {
                  Navigator.of(context).pop();
                },
              ),
              body: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        ImageForm(
                          width: 120,
                          height: 120,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(60.0),
                          ),
                          onCompleted: (file) => _imageFile = file,
                        ),
                        const SizedBox(height: 56),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Form(
                            key: _formKey,
                            child: Wrap(
                              runSpacing: 16,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: DefaultFormField(
                                        textInputAction: TextInputAction.next,
                                        maxLength: 20,
                                        counterText: "",
                                        hintText:
                                            "${LocaleKeys.fieldFirstNameHint.tr()}*",
                                        labelText:
                                            "${LocaleKeys.fieldFirstNameHint.tr()}*",
                                        controller: controllers['firstName'],
                                        onChanged: (value) {},
                                        validator: SupportValidators.compose([
                                          SupportValidators.required(
                                              fieldName: LocaleKeys
                                                  .fieldFirstName
                                                  .tr()),
                                          SupportValidators.name(
                                              fieldName: LocaleKeys
                                                  .fieldFirstName
                                                  .tr()),
                                        ]),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: DefaultFormField(
                                        textInputAction: TextInputAction.next,
                                        maxLength: 20,
                                        counterText: "",
                                        hintText:
                                            "${LocaleKeys.fieldLastNameHint.tr()}*",
                                        labelText:
                                            "${LocaleKeys.fieldLastNameHint.tr()}*",
                                        controller: controllers['lastName'],
                                        onChanged: (value) {},
                                        validator: SupportValidators.compose([
                                          SupportValidators.required(
                                              fieldName: LocaleKeys
                                                  .fieldLastName
                                                  .tr()),
                                          SupportValidators.name(
                                              fieldName: LocaleKeys
                                                  .fieldLastName
                                                  .tr()),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                EmailFormField(
                                  textInputAction: TextInputAction.next,
                                  hintText:
                                      "${LocaleKeys.fieldEmailHint.tr()}*",
                                  controller: controllers['email'],
                                  onChanged: (value) {},
                                  validator: SupportValidators.compose([
                                    SupportValidators.required(
                                        fieldName: LocaleKeys.fieldEmail.tr()),
                                    SupportValidators.email(
                                        fieldName: LocaleKeys.fieldEmail.tr()),
                                    SupportValidators.inRangeLength(6, 30,
                                        fieldName: LocaleKeys.fieldEmail.tr()),
                                  ]),
                                ),
                                PasswordFormField(
                                  textInputAction: TextInputAction.next,
                                  hintText:
                                      "${LocaleKeys.fieldPasswordHint.tr()}*",
                                  controller: controllers['password'],
                                  nextFocusNode: confirmPasswordNode,
                                  onChanged: (value) {},
                                  validator: SupportValidators.compose([
                                    SupportValidators.required(
                                        fieldName:
                                            LocaleKeys.fieldPassword.tr()),
                                    SupportValidators.inRangeLength(8, 256,
                                        fieldName:
                                            LocaleKeys.fieldPassword.tr()),
                                    SupportValidators.password(),
                                  ]),
                                ),
                                PasswordFormField(
                                  hintText:
                                      "${LocaleKeys.fieldConfirmPasswordHint.tr()}*",
                                  focusNode: confirmPasswordNode,
                                  onChanged: (value) {},
                                  validator: SupportValidators.compose([
                                    SupportValidators.required(
                                        fieldName: LocaleKeys
                                            .fieldConfirmPassword
                                            .tr()),
                                    SupportValidators.confirmPassword(
                                        controller: controllers['password'])
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 72),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Button(
                            text: LocaleKeys.createAccountEnterInfoPageSubmit
                                .tr(),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_imageFile != null) {
                                  registerInfoCubit.unsignedUpload(
                                      file: _imageFile!);
                                } else {
                                  _register(cubit: registerInfoCubit);
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        LinkTextSpan(
                          onTap: () => _onSignInTapped(context),
                          prefixText:
                              LocaleKeys.createAccountEnterInfoPageSignIn.tr(),
                          link: LocaleKeys.createAccountEnterInfoPageSignInLink
                              .tr(),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
