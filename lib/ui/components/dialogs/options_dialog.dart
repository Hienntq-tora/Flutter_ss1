import 'package:flutter/material.dart';

class OptionsDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  final List<String> optionList;
  final Widget? title;
  final Function(int index)? onOptionTap;

  OptionsDialog({
    required this.optionList,
    this.title,
    this.onOptionTap,
  });

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
          barrierDismissible: true,
          builder: (context) => WillPopScope(
                onWillPop: () => Future.value(true),
                child: SimpleDialog(
                  title: title,
                  children: List.generate(optionList.length, (index) {
                    return SimpleDialogOption(
                      child: Text(optionList[index]),
                      onPressed: () {
                        onOptionTap?.call(index);
                        close();
                      },
                    );
                  }),
                ),
              ));
    }
  }

  void dispose() {
    _context = null;
  }
}
