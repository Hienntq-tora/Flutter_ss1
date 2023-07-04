import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import '../../../../configs/font_manager.dart';
import '../../../components/buttons/link_text_span.dart';

class SeeMoreContentView extends StatelessWidget {
  const SeeMoreContentView({
    super.key,
    required this.title,
    required this.description,
    this.onPressed,
  });

  final String title;
  final String description;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: getBody1TextStyle(),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: getBody2TextStyle(),
          ),
          const SizedBox(height: 8),
          Center(
            child: LinkTextSpan(
              link: LocaleKeys.fieldContentSeeMore.tr(),
              onTap: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
