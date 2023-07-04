enum AppPage {
  login,
  home,
  searchLesson,
  error,
  createAccountSelectRole,
  createAccountEnterInfo,
  lessonStart,
  searchTutor,
  tutorDetail,
  comment,
  studentTutorAvailableTime,
  studentTutorLessons,
  updateInformation,
  changePassword,
  tutorFeedback,
  report,
  tutorHome,
  tutorLesson,
  tutorUpdateSchedule,
  tutorUpdateLesson,
  tutorUpdateInformation,
  dummy,
  tutorNotification,
  registerProcess,
  registerProcessReason,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      case AppPage.login:
        return "/login";
      case AppPage.searchLesson:
        return "/searchLesson";
      case AppPage.error:
        return "/error";
      case AppPage.createAccountSelectRole:
        return "/login/select_role";
      case AppPage.createAccountEnterInfo:
        return "/login/enter_info";
      case AppPage.lessonStart:
        return "/lesson_start";
      case AppPage.searchTutor:
        return "/search_tutor";
      case AppPage.tutorDetail:
        return "/tutorDetail";
      case AppPage.comment:
        return "/comment";
      case AppPage.studentTutorAvailableTime:
        return "/studen_tutor_available_time";
      case AppPage.studentTutorLessons:
        return "/student_tutor_lessons";
      case AppPage.updateInformation:
        return "/update_information";
      case AppPage.changePassword:
        return "/change_password";
      case AppPage.report:
        return "/report";
      case AppPage.tutorHome:
        return "/tutor_home";
      case AppPage.tutorLesson:
        return "/tutorLesson";
      case AppPage.tutorUpdateSchedule:
        return "/tutorUpdateSchedule";
      case AppPage.tutorUpdateLesson:
        return "/tutorUpdateLesson";
      case AppPage.tutorUpdateInformation:
        return "/tutorUpdateInformation";
      case AppPage.tutorFeedback:
        return "/tutorFeedback";
      case AppPage.dummy:
        return "/dummy";
      case AppPage.tutorNotification:
        return "/tutorNotification";
      case AppPage.registerProcess:
        return "/registerProcess";
      case AppPage.registerProcessReason:
        return "/registerProcessReason";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return "HOME";
      case AppPage.login:
        return "LOGIN";
      case AppPage.searchLesson:
        return "SEARCH_LESSON";
      case AppPage.error:
        return "ERROR";
      case AppPage.createAccountSelectRole:
        return "CREATE_ACCOUNT_SELECT_ROLE";
      case AppPage.createAccountEnterInfo:
        return "CREATE_ACCOUNT_ENTER_INFO";
      case AppPage.searchTutor:
        return "SEARCH_TUTOR";
      case AppPage.tutorDetail:
        return "TUTOR_DETAIL";
      case AppPage.comment:
        return "COMMENT";
      case AppPage.studentTutorAvailableTime:
        return "STUDENT_TUTOR_AVAILABLE_TIME";
      case AppPage.studentTutorLessons:
        return "STUDENT_TUTOR'S_LESSON";
      case AppPage.updateInformation:
        return "UPDATE_INFORMATION";
      case AppPage.changePassword:
        return "CHANGE_PASSWORD";
      case AppPage.report:
        return "REPORT";
      case AppPage.tutorHome:
        return "TUTOR_HOME";
      case AppPage.tutorLesson:
        return "TUTOR_LESSON";
      case AppPage.tutorUpdateSchedule:
        return "TUTOR UPDATE SCHEDULE";
      case AppPage.tutorUpdateLesson:
        return "TUTOR UPDATE LESSON";
      case AppPage.tutorUpdateInformation:
        return "TUTOR UPDATE INFORMATION";
      case AppPage.tutorFeedback:
        return "TUTOR Feedback";
      case AppPage.dummy:
        return "DUMMY";
      case AppPage.tutorNotification:
        return "TUTOR_NOTIFICATION";
      case AppPage.registerProcess:
        return "TUTOR Resgiter Process";
      case AppPage.registerProcessReason:
        return "Resgiter Process Reason";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.home:
        return "My App";
      case AppPage.login:
        return "My App Log In";
      case AppPage.searchLesson:
        return "Search Lesson";
      case AppPage.error:
        return "My App Error";
      case AppPage.createAccountSelectRole:
        return "My App Create Account Select Role";
      case AppPage.createAccountEnterInfo:
        return "My App Create Account Enter Info";
      case AppPage.searchTutor:
        return "Search Tutor";
      case AppPage.tutorDetail:
        return "Tutor Detail";
      case AppPage.comment:
        return "Comment";
      case AppPage.studentTutorAvailableTime:
        return "Student Tutor Available Time";
      case AppPage.studentTutorLessons:
        return "Student Tutor Lessons";
      case AppPage.updateInformation:
        return "Update Information";
      case AppPage.changePassword:
        return "Change Password";
      case AppPage.report:
        return "Report";
      case AppPage.tutorHome:
        return "Tutor Home";
      case AppPage.tutorLesson:
        return "Lesson";
      case AppPage.tutorUpdateSchedule:
        return "Tutor Update Schedule";
      case AppPage.tutorUpdateLesson:
        return "Tutor Update Lesson";
      case AppPage.tutorUpdateInformation:
        return "Tutor Update Information";
      case AppPage.tutorFeedback:
        return "Tutor Feedback";
      case AppPage.dummy:
        return "Dummy";
      case AppPage.tutorNotification:
        return "Notification";
      case AppPage.registerProcess:
        return "Tutor Register Process";
      case AppPage.registerProcessReason:
        return "Tutor Register Process";
      default:
        return "My App";
    }
  }
}
