import 'package:flutter/material.dart';

import '../../../../configs/font_manager.dart';
import '../../../components/bottom_sheet_handle_bar.dart';

class TutorDetailBottomSheet {
  TutorDetailBottomSheet({required this.title, this.subTitle});

  final String title;
  final String? subTitle;

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
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomSheetHandleBar(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      runSpacing: 14,
                      children: [
                        Text(
                          title,
                          style: getHeadline2TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      runSpacing: 14,
                      children: [
                        Text(
                          subTitle ?? '',
                          style: getBody2TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 54),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void dispose() {
    _context = null;
  }
}
