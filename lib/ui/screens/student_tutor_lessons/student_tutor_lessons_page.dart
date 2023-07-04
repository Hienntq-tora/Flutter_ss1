import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/card/lesson_card.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/lesson_detail/lesson_detail_bottom_sheet.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/student_tutor_available_time_params.dart';
import 'package:time_tracker/ui/screens/student_tutor_lessons/get_lessons_by_tutor_bloc_state.dart';
import 'package:time_tracker/ui/screens/student_tutor_lessons/get_lessons_by_tutor_cubit.dart';

class StudentTutorLessonsPage extends StatefulWidget {
  const StudentTutorLessonsPage({super.key, required this.tutorId});

  final String tutorId;

  @override
  State<StudentTutorLessonsPage> createState() =>
      _StudentTutorLessonsPageState();
}

class _StudentTutorLessonsPageState extends State<StudentTutorLessonsPage> {
  void _showLessonDetailBottomSheet(BuildContext context,
      {required Lesson lesson}) {
    LessonDetailBottomSheet(
      lesson: lesson,
      onCompleted: () => context.push(
        AppPage.studentTutorAvailableTime.toPath,
        extra: StudentTutorAvailableTimeParams(
          lesson.id,
          widget.tutorId,
        ),
      ),
    ).show(context);
  }

  Widget _buildList(List<Lesson>? list) {
    if (list != null) {
      return (list.isNotEmpty)
          ? ListView.separated(
              itemBuilder: (context, index) => LessonCard(
                lesson: list[index],
                onTap: () =>
                    _showLessonDetailBottomSheet(context, lesson: list[index]),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            )
          : Center(
              child: Text(
                LocaleKeys.lessonsByTutorNoData.tr(),
                style: getHeaderTextStyle(),
              ),
            );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<GetLessonsByTutorCubit>(
          create: (context) => di.sl<GetLessonsByTutorCubit>()
            ..getLessons(tutorId: widget.tutorId),
          child:
              BlocConsumer<GetLessonsByTutorCubit, GetLessonsByTutorBlocState>(
            listener: (context, state) {
              if (state.status == GetLessonsByTutorStatus.loadFailure) {
                ErrorHandler.showError(context, state.errorObject!);
              }
            },
            builder: (context, state) {
              return LoadingContainer(
                isLoading: state.status == GetLessonsByTutorStatus.loading,
                child: Column(
                  children: [
                    Header(
                      title: LocaleKeys.tutorDetailLessonButton.tr(),
                      backPress: () => context.pop(),
                    ),
                    Container(
                      height: 40.0,
                      padding: const EdgeInsets.only(left: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LocaleKeys.lessonsByTutorHeader.tr(),
                        style: getHeaderTextStyle(),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: _buildList(state.lessonList),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
