import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/screens/lesson_detail/lesson_detail_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/student_home/student_home_bloc_state.dart';
import 'package:time_tracker/ui/screens/student_home/student_home_cubit.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/student_tutor_available_time_params.dart';

import '../../../configs/icon_manager.dart';
import '../../../configs/theme_manager.dart';
import '../../../domain/entities/field.dart';
import '../../../domain/entities/lesson.dart';
import '../../../l10n/locale_keys.g.dart';
import '../../components/chip/app_chip.dart';
import '../../components/header/header.dart';
import '../../components/lessons/square_lesson_item.dart';
import '../../components/loading_container.dart';
import '../error/error_handler.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  void initState() {
    StudentHomeCubit cubit = BlocProvider.of<StudentHomeCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getHomeLessons();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Header(title: LocaleKeys.homeStudent.tr()),
        BlocConsumer<StudentHomeCubit, StudentHomeBlocState>(
            listener: (context, state) {
          if (state.status == StudentHomeStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        }, builder: (context, state) {
          return Expanded(
            child: LoadingContainer(
              isLoading: state.status == StudentHomeStatus.loading,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          context.push(AppPage.searchLesson.toPath);
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border:
                                  Border.all(color: GeneralColors.neutral3)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    LocaleKeys.homeSearchLesson.tr(),
                                    style: getBody2TextStyle(),
                                  ),
                                ),
                                SvgPicture.asset(
                                  IconManager.filter,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.color ??
                                          Colors.black,
                                      BlendMode.srcIn),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: buildListFields(fields: state.fields),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        children: [
                          Text(
                            LocaleKeys.homePopularLessons.tr(),
                            style: getHeadline2TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            children:
                                buildListLessons(lessons: state.popularLessons),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        children: [
                          Text(
                            LocaleKeys.homeNewLessons.tr(),
                            style: getHeadline2TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            children:
                                buildListLessons(lessons: state.newLessons),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        children: [
                          Text(
                            LocaleKeys.homeTopRatedLessons.tr(),
                            style: getHeadline2TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            children: buildListLessons(
                                lessons: state.topRatedLessons),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    ));
  }

  List<Widget> buildListFields({List<Field> fields = const []}) {
    return List.generate(fields.length, (index) {
      return Container(
        margin: EdgeInsets.only(right: index != 10 - 1 ? 8.0 : 0),
        child: AppChip(
          text: fields[index].name,
          onPressed: () {
            context.push(AppPage.searchLesson.toPath, extra: fields[index].id);
          },
        ),
      );
    });
  }

  List<Widget> buildListLessons({List<Lesson> lessons = const []}) {
    return List.generate(lessons.length, (index) {
      final lesson = lessons[index];

      return Container(
        margin: EdgeInsets.only(right: index != lessons.length - 1 ? 8.0 : 0),
        child: SquareLessonItem(
          imageUrl: lesson.imageUrl ?? '',
          text: lesson.title,
          callback: () {
            LessonDetailBottomSheet(
              lesson: lesson,
              onCompleted: () => context.push(
                AppPage.studentTutorAvailableTime.toPath,
                extra: StudentTutorAvailableTimeParams(
                  lessons[index].id,
                  lessons[index].user?.id ?? "",
                ),
              ),
            ).show(context);
          },
        ),
      );
    });
  }
}
