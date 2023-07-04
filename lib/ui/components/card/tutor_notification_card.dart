import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/data/resources/enums/tutor_notification_status.dart';
import 'package:time_tracker/domain/entities/tutor_notification.dart';
import 'package:time_tracker/ui/components/buttons/clipboard_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorNotificationCard extends StatelessWidget {
  final TutorNotification? notification;
  final VoidCallback onPressed;

  const TutorNotificationCard({
    super.key,
    required this.notification,
    required this.onPressed,
  });

  Future<void> _openLink() async {
    if (await canLaunchUrl(Uri.parse("${notification?.lessonLink}"))) {
      await launchUrl(Uri.parse("${notification?.lessonLink}"),
          mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget notificationBody;
    Color cardColors;
    switch (notification?.type) {
      case TutorNotificationType.payment:
        notification?.notificationTitle = TutorNotificationType.payment.toName;
        cardColors = Colors.blueAccent;
        notificationBody = Row(
          children: [
            Expanded(
              child: Text(
                "Transaction Hash: ${notification?.transactionHash}",
                style: getChipTextStyle(),
                maxLines: 3,
              ),
            ),
            ClipBoardButton(text: notification?.transactionHash),
          ],
        );
        break;
      case TutorNotificationType.lessonApproved:
        notification?.notificationTitle =
            TutorNotificationType.lessonApproved.toName;
        cardColors = Colors.redAccent;
        notificationBody = Text(
          "${notification?.lessonDescription}",
          style: getChipTextStyle(),
          maxLines: 3,
        );
        break;
      case TutorNotificationType.upComingLesson:
        notification?.notificationTitle =
            TutorNotificationType.upComingLesson.toName;
        cardColors = Colors.greenAccent;
        notificationBody = Text.rich(
          TextSpan(
            text: "Classroom: ${notification?.lessonLink}",
            style: getChipTextStyle(),
          ),
        );
        break;
      default:
        notification?.notificationTitle = "";
        cardColors = Colors.redAccent;
        notificationBody = const Text("");
    }
    return GestureDetector(
      onTap: () {
        if (notification?.type == TutorNotificationType.upComingLesson) {
          _openLink();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 5.0, color: cardColors),
          ),
          color: (notification?.isRead ?? true)
              ? GeneralColors.primaryBtnText
              : GeneralColors.primaryColor.withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${notification?.notificationTitle}",
                style: getTitle2TextStyle(),
              ),
              const SizedBox(height: 4),
              Text(
                "${notification?.lessonTitle}",
                style: getHeadline2TextStyle(),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              notificationBody,
              const SizedBox(height: 8),
              Text(
                "${notification?.notificationTime}",
                style: getSemiBold16TextStyle(),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
