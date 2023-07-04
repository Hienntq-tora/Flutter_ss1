import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../configs/font_manager.dart';
import '../../../../l10n/locale_keys.g.dart';
import '../../buttons/rounded_border_text_button.dart';
import '../../image_loader/image_loader.dart';
import 'tutor_appointment_card_model.dart';

class TutorAppoimentCard extends StatelessWidget {
  const TutorAppoimentCard({
    super.key,
    required this.itemModel,
    this.onTap,
  });

  final TutorAppoimentCardItem itemModel;
  final VoidCallback? onTap;

  Future<void> _openLink() async {
    if (await canLaunchUrl(Uri.parse(itemModel.linkMeeting))) {
      await launchUrl(Uri.parse(itemModel.linkMeeting),
          mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemModel.title,
                      style: getHeadline5TextStyle(),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageLoader(
                          imageUrl: itemModel.lessonImageUrl,
                          width: 63.0,
                          height: 63.0,
                          borderRadius: 10,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                runSpacing: 4.0,
                                spacing: 4.0,
                                children: [
                                  RoundedBorderTextButton(
                                    itemModel.difficulty,
                                    fillColor: Colors.transparent,
                                  ),
                                  RoundedBorderTextButton(
                                    itemModel.timeSlot,
                                    fillColor: Theme.of(context).primaryColor,
                                    textColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4.0),
                              Row(
                                children: [
                                  ImageLoader(
                                    imageUrl: itemModel.studentImageUrl,
                                    width: 34.0,
                                    height: 34.0,
                                    borderRadius: 17,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: Text(
                                      itemModel.fullName,
                                      style: getBody2TextStyle(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      LocaleKeys.tutorAppointmentLinkTitle.tr(),
                      style: getBody1TextStyle(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text.rich(
                  TextSpan(
                    text: itemModel.linkMeeting,
                    style: getCaptionTextStyle().copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = _openLink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
