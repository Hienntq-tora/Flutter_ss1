import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/rounded_border_text_button.dart';
import 'package:time_tracker/ui/components/image_loader/image_loader.dart';
import 'package:time_tracker/ui/components/rating_bar.dart';

class TutorLessonCard extends StatelessWidget {
  final Lesson? lesson;
  final VoidCallback onPressed;

  const TutorLessonCard({
    super.key,
    required this.lesson,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Stack(
              children: [
                ImageLoader(
                  imageUrl: lesson?.imageUrl ?? "",
                  width: 96,
                  height: 96,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: GeneralColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text("${LocaleKeys.currency.tr()}${lesson?.price}",
                        style: TextStyle(
                          color: GeneralColors.primaryBtnText,
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${lesson?.title}",
                    style: getHeadline2TextStyle(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${lesson?.description}",
                    maxLines: 3,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      RoundedBorderTextButton("${lesson?.difficulty}"),
                      const Spacer(),
                      RatingBar(
                        rating: lesson?.rating ?? 0,
                        showText: false,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
