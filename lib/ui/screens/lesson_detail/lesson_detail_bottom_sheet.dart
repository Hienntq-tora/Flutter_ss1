import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/divider/shadow_divider.dart';
import 'package:time_tracker/ui/components/image_loader/image_loader.dart';
import 'package:time_tracker/ui/components/rating_bar.dart';
import 'package:time_tracker/ui/components/tiles/description_tile.dart';

class LessonDetailBottomSheet {
  LessonDetailBottomSheet({required this.lesson, this.onCompleted});

  bool _bottomSheetIsOpen = false;

  late BuildContext? _context;

  final Lesson lesson;
  final VoidCallback? onCompleted;

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
        builder: _buildPage,
      );
    }
  }

  Widget _buildPage(BuildContext context) {
    final bodyTextStyle =
        getBody2TextStyle().copyWith(color: Theme.of(context).disabledColor);

    final safeAreaTopPadding =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

    return SizedBox(
      height: MediaQuery.of(context).size.height - safeAreaTopPadding,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: ImageLoader(
                            imageUrl: lesson.imageUrl ?? "",
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          lesson.title,
                          style: getHeadline4TextStyle(),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${lesson.difficulty}, ${lesson.field?.name}, ${LocaleKeys.currency.tr()}${lesson.price}",
                          style: bodyTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 8),
                            ImageLoader(
                              imageUrl: lesson.user?.userInfo?.avatarUrl ?? "",
                              width: 48,
                              height: 48,
                              borderRadius: 24,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: LocaleKeys
                                                .lessonDetailTutorNamePrefix
                                                .tr(),
                                            style: getBody2TextStyle(),
                                          ),
                                          TextSpan(
                                            text: "${lesson.user?.fullName}",
                                            style: getHeadline1TextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      CountryFlag(
                                        country: Country.fromCode(lesson
                                                .user?.userInfo?.countryFlag ??
                                            ""),
                                        height: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      RatingBar(
                                        rating: lesson.rating ?? 0.0,
                                        size: 20,
                                        ratingTextStyle: getBody2TextStyle(),
                                        reviewText: LocaleKeys.reviewsCount
                                            .tr(args: ["${0}"]),
                                        reviewTextStyle: getCaptionTextStyle(),
                                        textSpacing: 4,
                                        isDisabled: true,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => DescriptionTile(
                              title: lesson.content?[index].title ?? "",
                              description:
                                  lesson.content?[index].description ?? "",
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                            itemCount: (lesson.content ?? []).length,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ShadowDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 30,
            ),
            child: Button(
              text: LocaleKeys.lessonDetailSubmit.tr(),
              onPressed: () {
                close();
                onCompleted?.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}
