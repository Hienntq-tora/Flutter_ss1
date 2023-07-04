import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/dialogs/success_dialog.dart';
import 'package:time_tracker/ui/components/forms/pass_word_form_field.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/forgot_password/reset_password/reset_password_bloc_state.dart';
import 'package:time_tracker/ui/screens/forgot_password/reset_password/reset_password_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';

import '../../../components/loading_container.dart';

class ResetPasswordBottomSheet {
  ResetPasswordBottomSheet({required this.email});

  final String email;

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _bottomSheetIsOpen = false;

  late BuildContext? _context;

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
      _bottomSheetIsOpen = false;
    }
  }

  void show(BuildContext context) {
    final successDialog = SuccessDialog(
      LocaleKeys.verifyOtpSuccessTitle.tr(),
      LocaleKeys.resetPasswordSuccessMsg.tr(),
      submitText: LocaleKeys.verifyOtpSuccessSubmit.tr(),
      onClose: (_) => close(),
    );

    _context = context;
    if (_context != null) {
      _bottomSheetIsOpen = true;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return BlocProvider(
            create: (context) => di.sl<ResetPasswordCubit>(),
            child: BlocConsumer<ResetPasswordCubit, ResetPasswordBlocState>(
              listener: (context, state) {
                if (state.blocStatus == ResetPasswordStatus.loadSuccess) {
                  successDialog.show(context);
                }

                if (state.blocStatus == ResetPasswordStatus.loadFailure) {
                  ErrorHandler.showError(context, state.errorObject!);
                }
              },
              builder: (context, state) {
                final resetPasswordCubit =
                    BlocProvider.of<ResetPasswordCubit>(context);

                return LoadingContainer(
                  isLoading: state.blocStatus == ResetPasswordStatus.loading,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const BottomSheetHandleBar(),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      LocaleKeys.resetPasswordTitle.tr(),
                                      style: getToolBarTextStyle(),
                                    ),
                                    const SizedBox(height: 14.0),
                                    Text(
                                      LocaleKeys.resetPasswordMsg.tr(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 34.0),
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          PasswordFormField(
                                            controller: _passwordController,
                                            onChanged: (value) {},
                                            validator:
                                                SupportValidators.compose([
                                              SupportValidators.required(
                                                  fieldName: LocaleKeys
                                                      .fieldPassword
                                                      .tr()),
                                              SupportValidators.inRangeLength(
                                                  8, 256,
                                                  fieldName: LocaleKeys
                                                      .fieldPassword
                                                      .tr()),
                                              SupportValidators.password()
                                            ]),
                                          ),
                                          const SizedBox(height: 34.0),
                                          PasswordFormField(
                                            hintText: LocaleKeys
                                                .fieldConfirmPasswordHint
                                                .tr(),
                                            onChanged: (value) {},
                                            validator:
                                                SupportValidators.compose([
                                              SupportValidators.required(
                                                  fieldName: LocaleKeys
                                                      .fieldConfirmPassword
                                                      .tr()),
                                              SupportValidators.confirmPassword(
                                                  controller:
                                                      _passwordController),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 37.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Button(
                                  text: LocaleKeys.resetPasswordSubmit.tr(),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      resetPasswordCubit.resetPassword(
                                          email: email,
                                          password: _passwordController.text);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 56.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }
  }
}
