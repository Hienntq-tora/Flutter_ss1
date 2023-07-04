import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/ui/screens/tutor_detail/components/tutor_detail_bottom_sheet.dart';

import '../../../../configs/theme_manager.dart';

class TwoLineCard extends StatelessWidget {
  const TwoLineCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.isLast})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TutorDetailBottomSheet(title: title, subTitle: subtitle).show(context);
      },
      child: Container(
          margin: EdgeInsets.only(right: isLast ? 0 : 8),
          constraints: const BoxConstraints(maxWidth: 250),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: GeneralColors.neutral3)),
          child: Column(
            children: [
              Text(
                title,
                style: getBody1TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(subtitle,
                  style: getBody2TextStyle(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
            ],
          )),
    );
  }
}
