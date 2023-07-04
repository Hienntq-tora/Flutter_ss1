import 'package:flutter/material.dart';

class ShadowDivider extends StatelessWidget {
  const ShadowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).disabledColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Divider(
        height: 1,
        color: Theme.of(context).disabledColor.withOpacity(0.1),
      ),
    );
  }
}
