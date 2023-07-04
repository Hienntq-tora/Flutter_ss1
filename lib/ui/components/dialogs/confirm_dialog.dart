import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/secondary_button.dart';

class ConfirmDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  ConfirmDialog({
    this.title,
    this.message,
    this.submitText = 'OK',
    this.cancelText,
    this.lottieBuilder,
    this.onSubmit,
    this.onCancel,
    this.onClose,
  });

  final String? title;
  final String? message;
  final String submitText;
  final String? cancelText;
  final LottieBuilder? lottieBuilder;
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;
  final Function(dynamic value)? onClose;

  /// [close] Closes the progress dialog.
  void close({required bool extra}) {
    if (_dialogIsOpen && _context != null) {
      Navigator.pop(_context!, extra);
      _dialogIsOpen = false;
    }
  }

  Future<bool?> show(BuildContext context) async {
    _context = context;
    if (_context != null) {
      _dialogIsOpen = true;
      bool? confirmFlag;
      await Dialogs.materialDialog(
        color: Theme.of(_context!).dialogBackgroundColor,
        msg: message,
        msgAlign: TextAlign.center,
        title: title,
        lottieBuilder: lottieBuilder,
        customView: Container(),
        customViewPosition: CustomViewPosition.BEFORE_ACTION,
        context: context,
        onClose: (value) {
          confirmFlag = value;
          onClose?.call(value);
        },
        actions: [
          if (cancelText != null)
            Container(
              width: 86,
              padding: const EdgeInsets.only(top: 8),
              child: SecondaryButton(
                text: cancelText!,
                height: 38,
                onPressed: () {
                  onCancel?.call();
                  close(extra: false);
                },
              ),
            ),
          Container(
            width: 32,
            padding: const EdgeInsets.only(top: 8),
            child: Button(
              text: submitText,
              height: 38,
              onPressed: () {
                onSubmit?.call();
                close(extra: true);
              },
            ),
          ),
        ],
      );
      return confirmFlag;
    }
    return Future.value(null);
  }

  void dispose() {
    _context = null;
  }
}
