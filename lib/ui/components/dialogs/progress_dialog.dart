import 'package:flutter/material.dart';

class ProgressDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  ProgressDialog();

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
      showDialog(
          context: _context!,
          barrierDismissible: false,
          builder: (context) => WillPopScope(
                onWillPop: () => Future.value(false),
                child: const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ]),
                ),
              ));
    }
  }

  void dispose() {
    _context = null;
  }
}
