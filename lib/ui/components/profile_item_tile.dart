import 'package:flutter/material.dart';
import '../../configs/font_manager.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.largeTitle,
  });

  final String? largeTitle;
  final String title;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (largeTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        largeTitle!,
                        style: getHeadline2TextStyle(),
                      ),
                    ),
                  Text(
                    title,
                    style: getBody2TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
