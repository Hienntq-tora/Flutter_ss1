import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/domain/entities/education.dart';
import 'package:time_tracker/domain/entities/working_experience.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/tutor_detail/tutor_detail_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_detail/tutor_detail_cubit.dart';
import 'package:video_player/video_player.dart';

import '../../../configs/font_manager.dart';
import '../../../domain/entities/comment.dart';
import '../../components/header/header.dart';
import '../../components/video/controls_overlay.dart';
import '../error/error_handler.dart';
import 'components/comment_card.dart';
import 'components/one_line_card.dart';
import 'components/two_line_card.dart';

class TutorDetail extends StatefulWidget {
  const TutorDetail(
      {Key? key, required this.tutorId, required this.isFromLessonHistoryPage})
      : super(key: key);

  final String tutorId;
  final bool isFromLessonHistoryPage;

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  late VideoPlayerController _controller;
  final GlobalKey _reviewsWidgetKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    TutorDetailCubit cubit = BlocProvider.of<TutorDetailCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getTutorDetail(widget.tutorId);
    });
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..addListener(() {
        setState(() {});
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    super.initState();
  }

  void _scrollToWidget() async {
    await Future.delayed(Duration.zero);
    final RenderObject? renderObject =
        _reviewsWidgetKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(renderObject);
      final double offset =
          viewport.getOffsetToReveal(renderObject, 0.0).offset;
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: LocaleKeys.tutorDetailTitle.tr(),
        backPress: () {
          context.pop();
        },
      ),
      body: BlocConsumer<TutorDetailCubit, TutorDetailBlocState>(
          listener: (context, state) {
        if (state.status == TutorDetailStatus.loadFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
        if (state.status == TutorDetailStatus.loadSuccess) {
          _controller =
              VideoPlayerController.network(state.tutor?.profileVideoUrl ?? '')
                ..addListener(() {
                  setState(() {});
                })
                ..initialize().then((_) {
                  if (widget.isFromLessonHistoryPage) {
                    _scrollToWidget();
                  }
                  setState(() {});
                });
        }
      }, builder: (context, state) {
        return LoadingContainer(
          isLoading: state.status == TutorDetailStatus.loading,
          child: SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                VideoPlayer(_controller),
                                ControlsOverlay(controller: _controller),
                                VideoProgressIndicator(_controller,
                                    allowScrubbing: true),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.tutor?.fullName ?? '',
                              maxLines: 1,
                              style: getHeadline1TextStyle(),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(IconManager.star),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  (state.tutor?.ratings ?? 0).toString(),
                                  style: getBody2TextStyle(),
                                ),
                                Expanded(child: Container()),
                                CountryFlag(
                                  country: Country.fromCode(
                                      state.tutor?.countryFlag ?? ''),
                                  height: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    state.tutor?.location ?? '',
                                    style: getBody2TextStyle(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailAboutMe.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            Text(
                              state.tutor?.aboutMe ?? '',
                              style: getBody2TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailLanguagesAndSubjects.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildLanguageSubject(
                                    subjects:
                                        state.tutor?.languagesSubjects ?? []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailWorkingExperience.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildWorkingExperience(
                                    list:
                                        state.tutor?.workingExperiences ?? []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailEducation.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildEducation(
                                    list: state.tutor?.educations ?? []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailTeachingCertification.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildCertificate(
                                    list: state.tutor?.certificates ?? []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    SliverPadding(
                      key: _reviewsWidgetKey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.tutorDetailReviews.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: buildComment(
                                    list: state.tutor?.comments ?? []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(48 / 2),
                            child: CachedNetworkImage(
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              imageUrl: (state.tutor?.avatarUrl == null ||
                                      state.tutor?.avatarUrl == '' ||
                                      state.tutor?.avatarUrl == 'default.png')
                                  ? 'https://www.touchtaiwan.com/images/default.jpg'
                                  : state.tutor?.avatarUrl ??
                                      'https://www.touchtaiwan.com/images/default.jpg',
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
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            state.tutor?.fullName ?? '',
                            style: getHeadline3TextStyle(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 150,
                            child: Button(
                              text: LocaleKeys.tutorDetailLessonButton.tr(),
                              onPressed: () => context.push(
                                AppPage.studentTutorLessons.toPath,
                                extra: widget.tutorId,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }

  List<Widget> buildLanguageSubject({List<String> subjects = const []}) {
    return List.generate(subjects.length, (index) {
      return OneLineCard(
          title: subjects[index], isLast: subjects.length == index + 1);
    });
  }

  List<Widget> buildWorkingExperience(
      {List<WorkingExperience> list = const []}) {
    return List.generate(list.length, (index) {
      return TwoLineCard(
          title: list[index].title,
          subtitle: list[index].description ?? '',
          isLast: list.length == index + 1);
    });
  }

  List<Widget> buildEducation({List<Education> list = const []}) {
    return List.generate(list.length, (index) {
      return OneLineCard(
          title: list[index].title, isLast: list.length == index + 1);
    });
  }

  List<Widget> buildCertificate({List<String> list = const []}) {
    return List.generate(list.length, (index) {
      return OneLineCard(title: list[index], isLast: list.length == index + 1);
    });
  }

  List<Widget> buildComment({List<Comment> list = const []}) {
    return List.generate(list.length, (index) {
      return CommentCard(
          comment: list[index], isLast: list.length == index + 1);
    });
  }
}
