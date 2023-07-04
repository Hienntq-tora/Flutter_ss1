import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/forms/email_form_field.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_email/request_otp_bloc_state.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_email/request_otp_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';

import '../../../components/loading_container.dart';

class ForgotPasswordEnterEmailBottomSheet {
  ForgotPasswordEnterEmailBottomSheet({this.onRequestOtpSuccess});

  final Function(String email)? onRequestOtpSuccess;

  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _bottomSheetIsOpen = false;

  late BuildContext? _context;

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
      _bottomSheetIsOpen = false;
    }
  }

  void show(BuildContext context) {
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
            create: (context) => di.sl<RequestOtpCubit>(),
            child: BlocConsumer<RequestOtpCubit, RequestOtpBlocState>(
              listener: (context, state) {
                if (state.requestOtpStatus == RequestOtpStatus.loadSuccess) {
                  close();
                  onRequestOtpSuccess?.call(_controller.text);
                }

                if (state.requestOtpStatus == RequestOtpStatus.loadFailure ||
                    state.requestOtpStatus == RequestOtpStatus.invalidData) {
                  ErrorHandler.showError(context, state.errorObject!);
                }
              },
              builder: (context, state) {
                final requestOtpCubit =
                    BlocProvider.of<RequestOtpCubit>(context);

                return LoadingContainer(
                  isLoading: state.requestOtpStatus == RequestOtpStatus.loading,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const BottomSheetHandleBar(),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Wrap(
                              runSpacing: 14,
                              children: [
                                Text(
                                  LocaleKeys.forgotPasswordEnterEmailTitle.tr(),
                                  style: getHeadline1TextStyle(),
                                ),
                                Text(
                                  LocaleKeys.forgotPasswordEnterEmailMsg.tr(),
                                  style: getBody2TextStyle(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Form(
                              key: _formKey,
                              child: Wrap(
                                runSpacing: 32,
                                children: [
                                  EmailFormField(
                                    controller: _controller,
                                    onChanged: (value) {},
                                    validator: SupportValidators.compose([
                                      SupportValidators.required(
                                          fieldName:
                                              LocaleKeys.fieldEmail.tr()),
                                      SupportValidators.email(
                                          fieldName:
                                              LocaleKeys.fieldEmail.tr()),
                                      SupportValidators.inRangeLength(6, 30,
                                          fieldName:
                                              LocaleKeys.fieldEmail.tr()),
                                    ]),
                                  ),
                                  Button(
                                    text: LocaleKeys
                                        .forgotPasswordEnterEmailSubmit
                                        .tr(),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        requestOtpCubit.requestOtp(
                                            email: _controller.text);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 54),
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
