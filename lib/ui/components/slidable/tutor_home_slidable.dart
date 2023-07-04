import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:time_tracker/configs/font_manager.dart';

import '../../../l10n/locale_keys.g.dart';

class TutorHomeSlidable extends StatelessWidget {
  const TutorHomeSlidable({
    super.key,
    this.extentRatio = 0.3,
    this.confirmDismiss,
    required this.onDismissed,
    required this.child,
    this.dismissText,
  });

  final double extentRatio;
  final Future<bool> Function()? confirmDismiss;
  final VoidCallback onDismissed;
  final Widget child;
  final String? dismissText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: extentRatio,
        dismissible: DismissiblePane(
          onDismissed: onDismissed,
          confirmDismiss: confirmDismiss,
          closeOnCancel: true,
        ),
        children: [
          const Flexible(
            child: SizedBox(width: 10.0),
          ),
          CustomSlidableAction(
            flex: 6,
            padding: EdgeInsets.zero,
            onPressed: (context) async {
              final slidableController = Slidable.of(context);
              if (await confirmDismiss?.call() ?? false) {
                slidableController?.dismiss(
                  ResizeRequest(const Duration(milliseconds: 300), onDismissed),
                  duration: const Duration(milliseconds: 300),
                );
              }
            },
            backgroundColor: theme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
            foregroundColor: theme.textTheme.bodyMedium?.color,
            child: Text(
              dismissText ?? LocaleKeys.tutorAppointmentDismissTile.tr(),
              style: getHeadline5TextStyle(),
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
