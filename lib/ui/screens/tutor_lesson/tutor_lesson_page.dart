import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/data/resources/extra/extra.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/card/tutor_lesson_card.dart';
import 'package:time_tracker/ui/components/dialogs/confirm_dialog.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/components/slidable/tutor_home_slidable.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_cubit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../components/buttons/square_button.dart';

class TutorLessonPage extends StatefulWidget {
  const TutorLessonPage({super.key});

  @override
  State<TutorLessonPage> createState() => _TutorLessonPageState();
}

class _TutorLessonPageState extends State<TutorLessonPage> {
  List<Lesson>? _lessons;

  var cubit = di.sl<TutorLessonCubit>();

  Future<bool> _showConfirmDelete(String? lessonName, String? lessonId) async {
    final messageDialog = ConfirmDialog(
      title: "Confirm Delete",
      cancelText: "Cancel",
      message: 'Delete the lesson\n"$lessonName" ?',
    );
    final confirmFlag = await messageDialog.show(context) ?? false;
    if (confirmFlag) {
      return await cubit.deleteLesson(lessonId ?? "");
    }
    return false;
  }

  void _goToUpdateLesson(TutorUpdateLessonType type, {String? lessonId}) async {
    await context.push(
      AppPage.tutorUpdateLesson.toPath,
      extra: <String, dynamic>{
        'type': type,
        'lessonId': lessonId,
      },
    );
    cubit.getTutorLesson();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<TutorLessonCubit>(
      create: (context) => cubit..getTutorLesson(),
      child: BlocConsumer<TutorLessonCubit, TutorLessonBlocState>(
          listener: (context, state) {
        if (state.tutorLessonStatus == TutorLessonStatus.loadSuccess) {
          setState(() {
            _lessons = state.data?.toList();
          });
        }
        if (state.tutorLessonStatus == TutorLessonStatus.loadFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
        if (state.tutorLessonStatus == TutorLessonStatus.deleteFailure) {
          ErrorHandler.showError(context, state.errorObject!);
        }
      }, builder: (context, state) {
        return Scaffold(
          floatingActionButton: SquareButton(
            icon: Icon(
              Icons.add,
              color: theme.primaryColor,
              size: 30,
            ),
            color: theme.scaffoldBackgroundColor,
            elevation: 5,
            shadowColor: theme.shadowColor,
            dimension: 60.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            splashColor: theme.dividerColor,
            onPressed: () {},
          ),
          appBar: Header(
            title: LocaleKeys.tutorLessonTitle.tr(),
          ),
          resizeToAvoidBottomInset: false,
          body: LoadingContainer(
            isLoading: state.tutorLessonStatus == TutorLessonStatus.loading,
            child: SafeArea(
              child: (_lessons == null)
                  ? const Center()
                  : (_lessons!.isEmpty)
                      ? Center(
                          child: Text(LocaleKeys.noData.tr()),
                        )
                      : SlidableAutoCloseBehavior(
                          closeWhenOpened: true,
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _lessons?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: TutorHomeSlidable(
                                  dismissText: LocaleKeys.dissmissLabel.tr(),
                                  key: ValueKey(_lessons![index]),
                                  extentRatio: 0.2,
                                  confirmDismiss: () => _showConfirmDelete(
                                    _lessons?[index].title,
                                    _lessons?[index].id,
                                  ),
                                  onDismissed: () {
                                    setState(() {
                                      _lessons?.removeAt(index);
                                    });
                                  },
                                  child: TutorLessonCard(
                                    lesson: _lessons?[index],
                                    onPressed: () {
                                      _goToUpdateLesson(
                                        TutorUpdateLessonType.editLesson,
                                        lessonId: _lessons?[index].id,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          ),
                        ),
            ),
          ),
        );
      }),
    );
  }
}
