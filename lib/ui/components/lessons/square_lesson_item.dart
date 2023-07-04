import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../configs/font_manager.dart';

class SquareLessonItem extends StatelessWidget {
  const SquareLessonItem({
    super.key,
    required this.imageUrl,
    required this.text,
    this.callback,
  });

  final String imageUrl;
  final String text;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: 96,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: 96,
                height: 96,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: Text(
              text,
              style: getBody2TextStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ))
          ],
        ),
      ),
    );
  }
}
