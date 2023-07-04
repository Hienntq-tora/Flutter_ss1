import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: getHeadline1TextStyle(),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: getBody2TextStyle()
              .copyWith(color: Theme.of(context).disabledColor),
        ),
      ],
    );
  }
}
