import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';

class StudentTutorAvailableTimeHeader extends StatelessWidget {
  const StudentTutorAvailableTimeHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      toolbarHeight: 32,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          text,
          style: getHeadline1TextStyle().copyWith(
            color: Theme.of(context).dialogBackgroundColor,
          ),
        ),
      ),
      leadingWidth: 150,
    );
  }
}
