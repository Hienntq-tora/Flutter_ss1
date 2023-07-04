import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/routes/route_utils.dart';

import '../../../../configs/font_manager.dart';
import '../../../../configs/theme_manager.dart';

class RegisterProcessUI extends StatelessWidget {
  const RegisterProcessUI(
      {super.key,
      required this.isBlocked,
      required this.isReason,
      required this.decription,
      required this.title});
  final bool isBlocked;
  final bool isReason;
  final String decription;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: GeneralColors.neutral3)),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://www.touchtaiwan.com/images/default.jpg",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      title,
                                      style: getHeadline1TextStyle(),
                                    ),
                                  ),
                                  if (isReason)
                                    const SizedBox(
                                      child: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    )
                                  else
                                    SizedBox(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: GeneralColors.secondaryColor,
                                      ),
                                    )
                                ],
                              ),
                              Text(
                                decription,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          if (isReason)
                            InkWell(
                              onTap: !isBlocked
                                  ? () {
                                        context.push(
                                        AppPage.registerProcessReason.toPath,
                                      );
                                    }
                                  : null,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: const Text(
                                  "Reason",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isBlocked)
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      width: double.infinity,
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
