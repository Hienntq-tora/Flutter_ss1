import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constant.dart';
import 'package:time_tracker/utils/util.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 16.0,
    this.errorWidget = const Icon(Icons.error),
    this.placeholderUrl = defaultImageUrl,
  });

  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final String placeholderUrl;

  final Widget errorWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          width: width,
          height: height,
          fit: BoxFit.cover,
          imageUrl:
              (imageUrl.isValidImageLink) ? imageUrl ?? "" : placeholderUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(value: downloadProgress.progress),
          )),
          errorWidget: (context, url, error) => errorWidget,
        ),
      ),
    );
  }
}
