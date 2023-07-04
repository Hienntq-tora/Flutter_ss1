import 'package:flutter/material.dart';
import 'package:time_tracker/ui/screens/tutor_detail/components/tutor_detail_bottom_sheet.dart';

import '../../../../configs/font_manager.dart';
import '../../../../configs/theme_manager.dart';

class OneLineCard extends StatelessWidget {
  const OneLineCard({Key? key, required this.title, required this.isLast})
      : super(key: key);

  final String title;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TutorDetailBottomSheet(title: title).show(context);
      },
      child: Container(
          margin: EdgeInsets.only(right: isLast ? 0 : 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: GeneralColors.neutral3)),
          child: Text(
            title,
            style: getBody2TextStyle(),
          )),
    );
  }
}
