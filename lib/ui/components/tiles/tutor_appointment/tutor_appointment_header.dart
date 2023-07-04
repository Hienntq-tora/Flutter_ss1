import 'package:flutter/material.dart';

import '../../../../configs/font_manager.dart';

class TutorAppointmentHeader extends StatelessWidget {
  const TutorAppointmentHeader({
    super.key,
    required this.day,
    required this.date,
  });

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              day,
              style: getHeadline1TextStyle().copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              date,
              style: getBody1TextStyle(),
            ),
          ],
        ),
        const Expanded(
          child: Divider(indent: 3),
        )
      ],
    );
  }
}
