import 'package:flutter/material.dart';

class BottomSheetHandleBar extends StatelessWidget {
  const BottomSheetHandleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 34,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: 134,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xFFDADADA),
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }
}
