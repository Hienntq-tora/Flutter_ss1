import 'package:flutter/material.dart';
import 'package:time_tracker/domain/enums/date_formats.dart';
import 'package:time_tracker/ui/screens/tutor_available_time/tutor_available_time.dart';
import 'package:time_tracker/utils/util.dart';

import '../../../../configs/font_manager.dart';
import '../../buttons/rounded_border_text_button.dart';

class ReservableDateListTile extends StatelessWidget {
  const ReservableDateListTile({
    super.key,
    required this.model,
    this.onTap,
  });

  final ReservableDateTileModel model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final datetime = model.data.parseToDate(DateFormats.serverDate);
    final dateStr = datetime.parseToString(DateFormats.availableTimeDate);
    final dateSuffix = datetime?.getDayOfMonthSuffix();

    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "$dateStr$dateSuffix",
              style: getBody1TextStyle(),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: model.itemList.map(
                (reservableDate) {
                  return RoundedBorderTextButton(
                    "${reservableDate.timeString}",
                    fillColor: (reservableDate.isReservated ?? false)
                        ? theme.primaryColor
                        : Colors.transparent,
                    textColor: (reservableDate.isReservated ?? false)
                        ? theme.scaffoldBackgroundColor
                        : theme.textTheme.bodyMedium?.color,
                    borderColor: (reservableDate.isReservated ?? false)
                        ? Colors.transparent
                        : theme.primaryColor,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
