import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/data/resources/enums/lesson_schedule_status.dart';
import 'package:time_tracker/data/resources/extra/extra.dart';
import 'package:time_tracker/domain/entities/lesson_history_output.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/lesson_history/components/lesson_history_tile/lesson_history_tile.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_bloc_state.dart';
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_cubit.dart';
import 'package:time_tracker/ui/screens/lesson_start/lesson_start_model.dart';

class LessonHistoryPage extends StatefulWidget {
  const LessonHistoryPage({super.key});

  @override
  State<LessonHistoryPage> createState() => _LessonHistoryPageState();
}

class _LessonHistoryPageState extends State<LessonHistoryPage> {
  List<LessonHistoryOutput> _dataSource = [];
  late LessonHistoryCubit cubit;

  void gotoCommentPage(String bookingId) async {
    var resultFromCommentPage = await context.push(AppPage.comment.toPath,
        extra: CommentPageExtra(bookingId: bookingId));
    if (resultFromCommentPage.toString() == "need_reload_page") {
      cubit.getLessonHistory();
    }
  }

  void gotoTutorDetailPage(String userId) async {
    context.push(
      AppPage.tutorDetail.toPath,
      extra: TutorDetailExtra(
        userId: userId,
        isFromLessonHistoryPage: true,
      ),
    );
  }

  void gotoReportPage(String? lessonId) async {
    var resultFromReportPage = await context.push(
      AppPage.report.toPath,
      extra: ReportPageExtra(lessonId: lessonId),
    );

    if (resultFromReportPage.toString() == "need_reload_page") {
      cubit.getLessonHistory();
    }
  }

  void _onCommentButtonPressed({required int index}) async {
    final isCommented = _dataSource[index].isCommented ?? false;
    if (isCommented) {
      gotoTutorDetailPage(_dataSource[index].lesson?.user?.id ?? "");
    } else {
      gotoCommentPage(_dataSource[index].bookingId ?? "");
    }
  }

  void _onReportButtonPressed({required int index}) {
    final isReported = _dataSource[index].isReported ?? false;
    if (!isReported) {
      gotoReportPage(_dataSource[index].lesson?.id);
    }
  }

  void _onTilePressed({required int index}) {
    context.push(
      AppPage.lessonStart.toPath,
      extra: LessonStartModel(
        dateTime: _dataSource[index].reservableDate?.datetime,
        timeString: _dataSource[index].reservableDate?.timeString,
        linkMeeting: _dataSource[index].lesson?.linkMeeting,
        isDisabled: _dataSource[index].statusLessonSchedule !=
            LessonScheduleStatus.studying,
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _dataSource.length,
      itemBuilder: (context, index) {
        final dataItem = _dataSource[index];

        final model = LessonHistoryTileModel(
          lessonImageUrl: dataItem.lesson?.imageUrl ?? "",
          lessonTitle: dataItem.lesson?.title ?? "",
          lessonDifficulty: dataItem.lesson?.difficulty ?? "",
          lessonStatus: dataItem.statusLessonSchedule?.toName ?? "",
          tutorFullName: dataItem.lesson?.user?.fullName ?? "",
          countryCode: dataItem.lesson?.user?.userInfo?.countryFlag ?? "",
          isCommented: dataItem.isCommented ?? false,
          isReported: dataItem.isReported ?? false,
          isLocked:
              dataItem.statusLessonSchedule == LessonScheduleStatus.locked,
        );

        return LessonHistoryTile(
          model: model,
          onTap: () => _onTilePressed(index: index),
          onCommentButtonPressed: () => _onCommentButtonPressed(index: index),
          onReportButtonPressed: () => _onReportButtonPressed(index: index),
        );
      },
    );
  }

  @override
  void initState() {
    cubit = BlocProvider.of<LessonHistoryCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getLessonHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Header(title: LocaleKeys.bottomNavigationHistory.tr()),
          BlocConsumer<LessonHistoryCubit, LessonHistoryBlocState>(
            listener: (context, state) {
              if (state.status == LessonHistoryStatus.loadSuccess) {
                setState(() {
                  _dataSource = state.output;
                });
              }

              if (state.status == LessonHistoryStatus.loadFailure) {
                ErrorHandler.showError(context, state.errorObject!);
              }
            },
            builder: (context, state) {
              return Expanded(
                child: LoadingContainer(
                  isLoading: state.status == LessonHistoryStatus.loading,
                  child: _buildList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
