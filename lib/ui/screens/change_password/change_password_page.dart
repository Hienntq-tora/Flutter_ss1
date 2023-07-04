import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/forms/pass_word_form_field.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/change_password/change_password_bloc_state.dart';
import 'package:time_tracker/ui/screens/change_password/change_password_cubit.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/utils/util.dart';

class FormFieldModel {
  FormFieldModel({
    required this.controller,
    required this.node,
  });

  final TextEditingController controller;
  final FocusNode node;
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  String get _email => di.sl<LocalDataResource>().getUserData().email;
  Map<String, FormFieldModel> _modelDictionaries = {};

  void _updatePassword(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final cubit = BlocProvider.of<ChangePasswordCubit>(context);
      final oldPassword = _modelDictionaries["oldPassword"]?.controller.text;
      final newPassword = _modelDictionaries["newPassword"]?.controller.text;

      if (oldPassword.isEmptyOrNull || newPassword.isEmptyOrNull) return;

      cubit.changePassword(
          email: _email, oldPassword: oldPassword!, password: newPassword!);
    }
  }

  @override
  void initState() {
    super.initState();
    final fields = ["oldPassword", "newPassword", "confirmPassword"];
    _modelDictionaries = {
      for (final field in fields)
        field: FormFieldModel(
          controller: TextEditingController(),
          node: FocusNode(),
        )
    };
  }

  @override
  void dispose() {
    _modelDictionaries.forEach((_, value) {
      value.controller.dispose();
      value.node.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
      create: (context) => di.sl<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordBlocState>(
          listener: (context, state) {
        if (state.status == ChangePasswordStatus.loadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${state.output?.message}")),
          );
        }

        if (state.status == ChangePasswordStatus.loadFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
      }, builder: (context, state) {
        return LoadingContainer(
          isLoading: state.status == ChangePasswordStatus.loading,
          child: Scaffold(
            appBar: Header(
              title: LocaleKeys.changePasswordTitle.tr(),
              backPress: () => context.pop(),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Form(
                      key: _formKey,
                      child: Wrap(
                        runSpacing: 16.0,
                        children: [
                          PasswordFormField(
                            hintText:
                                "${LocaleKeys.fieldOldPasswordHint.tr()}*",
                            controller:
                                _modelDictionaries["oldPassword"]?.controller,
                            focusNode: _modelDictionaries["oldPassword"]?.node,
                            nextFocusNode:
                                _modelDictionaries["newPassword"]?.node,
                            onChanged: (value) {},
                            validator: SupportValidators.compose([
                              SupportValidators.required(
                                fieldName: LocaleKeys.fieldOldPassword.tr(),
                              ),
                              SupportValidators.inRangeLength(
                                8,
                                256,
                                fieldName: LocaleKeys.fieldOldPassword.tr(),
                              ),
                              SupportValidators.password(
                                field: LocaleKeys.fieldOldPassword.tr(),
                              ),
                            ]),
                            textInputAction: TextInputAction.next,
                          ),
                          PasswordFormField(
                            hintText: "${LocaleKeys.fieldPasswordHint.tr()}*",
                            controller:
                                _modelDictionaries["newPassword"]?.controller,
                            focusNode: _modelDictionaries["newPassword"]?.node,
                            nextFocusNode:
                                _modelDictionaries["confirmPassword"]?.node,
                            onChanged: (value) {},
                            validator: SupportValidators.compose([
                              SupportValidators.required(
                                  fieldName: LocaleKeys.fieldPassword.tr()),
                              SupportValidators.inRangeLength(
                                8,
                                256,
                                fieldName: LocaleKeys.fieldPassword.tr(),
                              ),
                              SupportValidators.password(),
                            ]),
                            textInputAction: TextInputAction.next,
                          ),
                          PasswordFormField(
                            hintText:
                                "${LocaleKeys.fieldConfirmPasswordHint.tr()}*",
                            controller: _modelDictionaries["confirmPassword"]
                                ?.controller,
                            focusNode:
                                _modelDictionaries["confirmPassword"]?.node,
                            onChanged: (value) {},
                            validator: SupportValidators.compose([
                              SupportValidators.required(
                                fieldName: LocaleKeys.fieldConfirmPassword.tr(),
                              ),
                              SupportValidators.confirmPassword(
                                controller: _modelDictionaries["newPassword"]
                                    ?.controller,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Button(
                      text: LocaleKeys.changePasswordSubmit.tr(),
                      onPressed: () => _updatePassword(context),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
