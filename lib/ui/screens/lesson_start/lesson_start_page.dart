import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/clipboard_button.dart';
import 'package:time_tracker/ui/components/buttons/rounded_border_text_button.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'lesson_start_model.dart';

class LessonStartPage extends StatelessWidget {
  const LessonStartPage({
    super.key,
    required this.model,
  });

  final LessonStartModel model;

  Future<void> _openLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final classroomLink =
        (model.linkMeeting != null && model.linkMeeting!.isNotEmpty)
            ? model.linkMeeting ?? ""
            : LocaleKeys.lessonStartNoLink.tr();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(
              title: LocaleKeys.lessonStartAppBar.tr(),
              backPress: () {
                Navigator.of(context).pop();
              },
            ),
            AbsorbPointer(
              absorbing: model.isDisabled,
              child: InkWell(
                onTap: () async => _openLink(model.linkMeeting ?? ""),
                child: Ink(
                  color: model.isDisabled ? GeneralColors.grey20 : null,
                  padding: const EdgeInsets.fromLTRB(16.0, 40.0, 8.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedBorderTextButton(
                        "${model.dateTime} • ${model.timeString}",
                        textColor: theme.dialogBackgroundColor,
                        fillColor: theme.primaryColor,
                        borderColor: Colors.transparent,
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              classroomLink,
                              style: getCaptionTextStyle()
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ),
                          ClipBoardButton(text: model.linkMeeting),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
