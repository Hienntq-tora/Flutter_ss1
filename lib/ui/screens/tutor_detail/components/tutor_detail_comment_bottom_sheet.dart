import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/utils/util.dart';

import '../../../../configs/font_manager.dart';
import '../../../../configs/icon_manager.dart';
import '../../../../domain/entities/comment.dart';
import '../../../components/bottom_sheet_handle_bar.dart';

class TutorDetailCommentBottomSheet {
  TutorDetailCommentBottomSheet({required this.comment});

  final Comment comment;

  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
      _bottomSheetIsOpen = false;
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (_context != null) {
      _bottomSheetIsOpen = true;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomSheetHandleBar(),
                  const SizedBox(height: 16),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
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
                                  imageUrl: (comment
                                              .avatar.isEmptyOrNull ||
                                          comment.avatar ==
                                              "default.png")
                                      ? "https://www.touchtaiwan.com/images/default.jpg"
                                      : comment.avatar ??
                                          "https://www.touchtaiwan.com/images/default.jpg",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
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
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: List.generate(
                                            (comment.rating ?? 0).toInt(),
                                            (_) {
                                          return SvgPicture.asset(
                                              IconManager.star);
                                        }),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        (comment.rating ?? 0)
                                            .toInt()
                                            .toString(),
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
                          const SizedBox(height: 16,),
                          Text(comment.content ?? '',
                              style: getBody2TextStyle(),
                              textAlign: TextAlign.left,),
                          const SizedBox(height: 16,),
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void dispose() {
    _context = null;
  }
}
