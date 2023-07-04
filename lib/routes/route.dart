import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/data/resources/enums/user_role.dart';
import 'package:time_tracker/data/resources/extra/extra.dart';
import 'package:time_tracker/routes/route_utils.dart';
import 'package:time_tracker/ui/screens/change_password/change_password_page.dart';
import 'package:time_tracker/ui/screens/comment/comment_page.dart';
import 'package:time_tracker/ui/screens/create_account/enter_information/create_account_enter_info_page.dart';
import 'package:time_tracker/ui/screens/create_account/select_role/create_account_select_role_page.dart';
import 'package:time_tracker/ui/screens/dummy/dummy_page.dart';
import 'package:time_tracker/ui/screens/home/home.dart';
import 'package:time_tracker/ui/screens/lesson_start/lesson_start_model.dart';
import 'package:time_tracker/ui/screens/lesson_start/lesson_start_page.dart';
import 'package:time_tracker/ui/screens/login/login.dart';
import 'package:time_tracker/ui/screens/register_process/component/register_process_reason_view.dart';
import 'package:time_tracker/ui/screens/report/report_page.dart';
import 'package:time_tracker/ui/screens/search_lesson/search_lesson.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/studen_tutor_available_time_page.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/student_tutor_available_time_params.dart';
import 'package:time_tracker/ui/screens/student_tutor_lessons/student_tutor_lessons_page.dart';
import 'package:time_tracker/ui/screens/tutor_feedback/tutor_feedback_page.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_page.dart';
import 'package:time_tracker/ui/screens/register_process/register_process_page.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/tutor_update_lesson.dart';
import 'package:time_tracker/ui/screens/tutor_update_information/tutor_update_infomation_page.dart';
import 'package:time_tracker/ui/screens/update_information/update_information_page.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_page.dart';

import '../ui/screens/error/error.dart';
import '../ui/screens/login/auth_cubit.dart';
import '../ui/screens/tutor_detail/tutor_detail_provider.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  AppRouter(this._loginCubit);

  late final AuthCubit _loginCubit;

  String get homePath {
    switch (_loginCubit.userRole) {
      case UserRole.tutor:
        return AppPage.tutorHome.toPath;
      case UserRole.student:
        return AppPage.home.toPath;
      case UserRole.admin:
      case null:
        return AppPage.error.toPath;
    }
  }

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: _loginCubit,
    initialLocation: homePath,
    routes: <GoRoute>[
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppPage.login.toPath,
        name: AppPage.login.toName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppPage.searchLesson.toPath,
        name: AppPage.searchLesson.toName,
        pageBuilder: (context, state) {
          String fieldId = "";
          if (state.extra != null) {
            fieldId = state.extra as String;
          }
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: SearchLessonPage(
              fieldId: fieldId,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: AppPage.tutorDetail.toPath,
        name: AppPage.tutorDetail.toName,
        pageBuilder: (context, state) {
          final id = (state.extra as TutorDetailExtra).userId;
          final isFromLessonHistoryPage =
              (state.extra as TutorDetailExtra).isFromLessonHistoryPage;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: TutorDetailProvider(
                tutorId: id, isFromLessonHistoryPage: isFromLessonHistoryPage),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          );
        },
      ),
      GoRoute(
        path: AppPage.comment.toPath,
        name: AppPage.comment.toName,
        builder: (context, state) {
          return CommentPage(
            bookingId: (state.extra as CommentPageExtra).bookingId,
          );
        },
      ),
      GoRoute(
        path: AppPage.lessonStart.toPath,
        builder: (context, state) =>
            LessonStartPage(model: state.extra as LessonStartModel),
      ),
      GoRoute(
        path: AppPage.createAccountSelectRole.toPath,
        name: AppPage.createAccountSelectRole.toName,
        builder: (context, state) => const CreateAccountSelectRolePage(),
      ),
      GoRoute(
        path: AppPage.createAccountEnterInfo.toPath,
        name: AppPage.createAccountEnterInfo.toName,
        builder: (context, state) {
          final userRole = state.extra as UserRole;
          return CreateAccountEnterInfoPage(userRole: userRole);
        },
      ),
      GoRoute(
        path: AppPage.studentTutorLessons.toPath,
        name: AppPage.studentTutorLessons.name,
        builder: (context, state) =>
            StudentTutorLessonsPage(tutorId: state.extra as String),
      ),
      GoRoute(
        path: AppPage.error.toPath,
        name: AppPage.error.toName,
        builder: (context, state) => const ErrorPage(),
      ),
      GoRoute(
        path: AppPage.studentTutorAvailableTime.toPath,
        builder: (context, state) => StudentTutorAvailableTimePage(
            params: state.extra as StudentTutorAvailableTimeParams),
      ),
      GoRoute(
        path: AppPage.updateInformation.toPath,
        name: AppPage.updateInformation.toName,
        builder: (context, state) => const UpdateInformationPage(),
      ),
      GoRoute(
        path: AppPage.changePassword.toPath,
        name: AppPage.changePassword.toName,
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: AppPage.report.toPath,
        name: AppPage.report.toName,
        builder: (context, state) => ReportPage(
          lessonId: (state.extra as ReportPageExtra).lessonId,
        ),
      ),
      GoRoute(
        path: AppPage.tutorHome.toPath,
        name: AppPage.tutorHome.toName,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: TutorHome(screen: state.extra as int?),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppPage.tutorLesson.toPath,
        name: AppPage.tutorLesson.toName,
        builder: (context, state) => const TutorLessonPage(),
      ),
      GoRoute(
        path: AppPage.tutorUpdateSchedule.toPath,
        name: AppPage.tutorUpdateSchedule.toName,
        builder: (context, state) =>
            UpdateSchedulePage(initialDate: state.extra as String?),
      ),
      GoRoute(
        path: AppPage.tutorUpdateLesson.toPath,
        name: AppPage.tutorUpdateLesson.toName,
        builder: (context, state) {
          final params = state.extra as Map<String, dynamic>;
          return TutorUpdateLesson(
            type: params['type'] as TutorUpdateLessonType,
            lessonId: params['lessonId'] as String?,
          );
        },
      ),
      GoRoute(
        path: AppPage.tutorUpdateInformation.toPath,
        name: AppPage.tutorUpdateInformation.toName,
        builder: (context, state) => const TutorUpdateInfomationPage(),
      ),
      GoRoute(
        path: AppPage.tutorFeedback.toPath,
        name: AppPage.tutorFeedback.toName,
        builder: (context, state) =>
            TuTorFeedback(initialDate: state.extra as String?),
      ),
      GoRoute(
        path: AppPage.dummy.toPath,
        name: AppPage.dummy.toName,
        builder: (context, state) => const DummyPage(),
      ),
      GoRoute(
        path: AppPage.tutorNotification.toPath,
        name: AppPage.tutorNotification.toName,
        builder: (context, state) => const TutorLessonPage(),
      ),

      GoRoute(
        path: AppPage.registerProcess.toPath,
        name: AppPage.registerProcess.toName,
        builder: (context, state) => const RegisterProcess(),
      ),
      GoRoute(
        path: AppPage.registerProcessReason.toPath,
        name: AppPage.registerProcessReason.toName,
        builder: (context, state) => const ProcessReason(),
      ),

    ],
    errorBuilder: (context, state) => const ErrorPage(),
    redirect: (context, state) {
      final isLoggedIn = _loginCubit.loginState;
      final isLoginSubRoutes = state.subloc.contains(AppPage.login.toPath);

      if (state.subloc.contains(AppPage.dummy.toPath)) {
        return AppPage.dummy.toPath;
      }
      if (!isLoggedIn && !isLoginSubRoutes) {
        return AppPage.login.toPath;
      }
      if (isLoggedIn && isLoginSubRoutes) {
        return homePath;
      }
      return null;
    },
  );
}
