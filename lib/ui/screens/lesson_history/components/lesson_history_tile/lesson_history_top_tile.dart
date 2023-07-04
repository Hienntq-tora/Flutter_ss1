import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/ui/components/buttons/rounded_border_text_button.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/lesson_history_tile/lesson_history_tile.dart';

class HistoryTopTile extends StatelessWidget {
  const HistoryTopTile({
    super.key,
    required this.model,
  });

  final LessonHistoryTileModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
          child: CachedNetworkImage(
            width: 65,
            height: 65,
            fit: BoxFit.cover,
            imageUrl: model.lessonImageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                model.lessonTitle,
                style: getHeadline2TextStyle(),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  RoundedBorderTextButton(model.lessonDifficulty),
                  RoundedBorderTextButton(model.lessonStatus),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
