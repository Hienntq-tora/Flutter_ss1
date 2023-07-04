import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/ui/screens/tutor_detail/components/tutor_detail_comment_bottom_sheet.dart';
import 'package:time_tracker/utils/util.dart';

import '../../../../configs/font_manager.dart';
import '../../../../configs/icon_manager.dart';
import '../../../../configs/theme_manager.dart';
import '../../../../domain/entities/comment.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key, required this.comment, required this.isLast})
      : super(key: key);

  final Comment comment;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : 8),
      child: InkWell(
        onTap: () {
          TutorDetailCommentBottomSheet(comment: comment).show(context);
        },
        child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: GeneralColors.neutral3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(48 / 2),
                      child: CachedNetworkImage(
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        imageUrl: (comment.avatar.isEmptyOrNull ||
                                comment.avatar == "default.png")
                            ? "https://www.touchtaiwan.com/images/default.jpg"
                            : comment.avatar ??
                                "https://www.touchtaiwan.com/images/default.jpg",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: List.generate(
                                  (comment.rating ?? 0).toInt(), (_) {
                                return SvgPicture.asset(IconManager.star);
                              }),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              (comment.rating ?? 0).toInt().toString(),
                              style: getBody2TextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Text(
                          comment.fullName ?? '',
                          style: getBody2TextStyle(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(comment.content ?? '',
                    style: getBody2TextStyle(),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(comment.createdAt ?? '',
                      style: getBody2TextStyle(),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            )),
      ),
    );
  }
}
