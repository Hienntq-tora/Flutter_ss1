import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:time_tracker/configs/lottie_manager.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';

class SuccessDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  SuccessDialog(this.title, this.message,
      {this.onClose, this.submitText = 'OK'});

  final String title;
  final String message;
  final String submitText;
  final Function(dynamic value)? onClose;

  /// [close] Closes the progress dialog.
  void close() {
    if (_dialogIsOpen && _context != null) {
      Navigator.pop(_context!);
      _dialogIsOpen = false;
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (_context != null) {
      _dialogIsOpen = true;
      Dialogs.materialDialog(
          color: Theme.of(_context!).dialogBackgroundColor,
          msg: message,
          title: title,
          onClose: onClose,
          lottieBuilder: Lottie.asset(
            LottieManager.success,
            fit: BoxFit.contain,
          ),
          customView: Container(),
          customViewPosition: CustomViewPosition.BEFORE_ACTION,
          context: context,
          actions: [
            Button(
              text: submitText,
              onPressed: () {
                close();
              },
            )
          ]);
    }
  }

  void dispose() {
    _context = null;
  }
}
