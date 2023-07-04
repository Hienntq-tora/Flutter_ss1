import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/lottie_manager.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/domain/enums/enter_otp_type.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/link_text_span.dart';
import 'package:time_tracker/ui/components/dialogs/message_dialog.dart';
import 'package:time_tracker/ui/components/dialogs/success_dialog.dart';
import 'package:time_tracker/ui/components/forms/otp_form_field.dart';
import 'package:time_tracker/ui/screens/create_account/enter_otp/create_account_enter_otp_bloc_state.dart';
import 'package:time_tracker/ui/screens/create_account/enter_otp/create_account_enter_otp_cubit.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';

import '../../../components/loading_container.dart';

class CreateAccountEnterOtpBottomSheet {
  CreateAccountEnterOtpBottomSheet({
    required this.email,
    this.onVerifyOtpSuccess,
  });

  final String email;
  VoidCallback? onVerifyOtpSuccess;

  final _type = EnterOtpType.createAccount;
  final _controller = TextEditingController();
  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;

  void _waitThenClear() {
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => _controller.clear());
  }

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
      _bottomSheetIsOpen = false;
    }
  }

  void show(BuildContext context) {
    final successDialog = SuccessDialog(
      LocaleKeys.verifyOtpSuccessTitle.tr(),
      LocaleKeys.verifyOtpSuccessMsg.tr(),
      submitText: LocaleKeys.verifyOtpSuccessSubmit.tr(),
      onClose: (value) {
        close();
        onVerifyOtpSuccess?.call();
      },
    );

    _context = context;
    if (_context != null) {
      _bottomSheetIsOpen = true;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: BlocProvider(
              create: (context) => di.sl<CreateAccountEnterOtpCubit>(),
              child: BlocConsumer<CreateAccountEnterOtpCubit,
                  CreateAccountEnterOtpBlocState>(
                listener: (context, state) {
                  if (state.enterOtpStatus ==
                      CreateAccountEnterOtpStatus.resendOtpSuccess) {
                    final otpSentDialog = MessageDialog(
                      lottieBuilder: LottieBuilder.asset(
                        LottieManager.otpSent,
                        fit: BoxFit.contain,
                      ),
                      message: LocaleKeys.resendOtpDialogMsg.tr(),
                      submitText: LocaleKeys.messageDialogSubmit.tr(),
                      onClose: (_) => _waitThenClear(),
                    );
                    otpSentDialog.show(context);
                  }

                  if (state.enterOtpStatus ==
                      CreateAccountEnterOtpStatus.verifyOtpSuccess) {
                    successDialog.show(context);
                  }

                  if (state.enterOtpStatus ==
                      CreateAccountEnterOtpStatus.invalidOtp) {
                    ErrorHandler.showError(
                      context,
                      state.errorObject!,
                      onClose: () => _waitThenClear(),
                    );
                  }

                  if (state.enterOtpStatus ==
                      CreateAccountEnterOtpStatus.failure) {
                    ErrorHandler.showError(context, state.errorObject!);
                  }
                },
                builder: (context, state) {
                  CreateAccountEnterOtpCubit cubit =
                      BlocProvider.of<CreateAccountEnterOtpCubit>(context);
                  return LoadingContainer(
                    isLoading: state.enterOtpStatus ==
                        CreateAccountEnterOtpStatus.loading,
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
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Wrap(
                                    runSpacing: 14,
                                    children: [
                                      Text(
                                        LocaleKeys.enterOtpHeader.tr(),
                                        style: getHeadline1TextStyle(),
                                      ),
                                      Text(
                                        LocaleKeys.enterOtpMessage.tr(),
                                        style: getBody2TextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                OtpFormField(
                                  controller: _controller,
                                  onCompleted: (_) => cubit.verifyOtp(
                                    email: email,
                                    otp: _controller.text,
                                    type: _type,
                                  ),
                                ),
                                const SizedBox(height: 64),
                                LinkTextSpan(
                                  prefixText: LocaleKeys.resendOtp.tr(),
                                  link: LocaleKeys.resendOtpLink.tr(),
                                  onTap: () {
                                    cubit.resendVerifyOtp(
                                        email: email, type: _type);
                                  },
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: Button(
                                    text: LocaleKeys.verifyOtpSubmit.tr(),
                                    onPressed: () {
                                      cubit.verifyOtp(
                                        email: email,
                                        otp: _controller.text,
                                        type: _type,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 56),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }
}
