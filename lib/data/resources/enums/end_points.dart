enum EndPoints {
  login,
  registerInfo,
  createAccountResendVerifyOtp,
  createAccountVerifyOtp,
  forgotPasswordResendVerifyOtp,
  forgotPasswordVerifyOtp,
  resetPassword,
  getLessons,
  getTutorLessons,
  deleteTutorLessons,
  getFields,
  lessonHistory,
  getTutors,
  getTutorDetail,
  postComment,
  getComment,
  postReport,
  getReservableDate,
  createBooking,
  updateUserInfo,
  changePassword,
  tutorAppointmentList,
  appointment,
  createReservableDate,
  deleteReservableDate,
  logout,
  lessonDetail,
  updateLesson,
  createFeedback,
  getNotifications,
  readAllNotification,
  registerFcmToken,
}

extension EndPointsX on EndPoints {
  String get toPath {
    switch (this) {
      case EndPoints.login:
        return "/auth/login";
      case EndPoints.registerInfo:
        return "/auth/register";
      case EndPoints.createAccountResendVerifyOtp:
        return "/auth/resend-verify-otp";
      case EndPoints.createAccountVerifyOtp:
        return "/auth/verify-otp";
      case EndPoints.forgotPasswordResendVerifyOtp:
        return "${EndPoints.createAccountResendVerifyOtp.toPath}-forgot-password";
      case EndPoints.forgotPasswordVerifyOtp:
        return "${EndPoints.createAccountVerifyOtp.toPath}-forgot-password";
      case EndPoints.resetPassword:
        return "/auth/reset-password";
      case EndPoints.getLessons:
        return "/client/list-lesson";
      case EndPoints.getTutorLessons:
        return "/client/list-lesson-tutor";
      case EndPoints.getFields:
        return "/client/list-field";
      case EndPoints.lessonHistory:
        return "/client/get-lesson-history";
      case EndPoints.getTutors:
        return "/client/list-teacher";
      case EndPoints.getTutorDetail:
        return "/client/detail-teacher";
      case EndPoints.postComment:
        return "/client/create-comment";
      case EndPoints.getComment:
        return "/client/detail-comment";
      case EndPoints.postReport:
        return "/client/lesson/create-report";
      case EndPoints.getReservableDate:
        return "/client/get-reservable-date";
      case EndPoints.createBooking:
        return "/client/create-booking";
      case EndPoints.updateUserInfo:
        return "/auth/update-user-info";
      case EndPoints.deleteTutorLessons:
        return "/client/delete-lesson-tutor";
      case EndPoints.changePassword:
        return "/auth/change-password";
      case EndPoints.tutorAppointmentList:
        return "/client/get-booking";
      case EndPoints.appointment:
        return "/client/update";
      case EndPoints.createReservableDate:
        return "/client/create-reservable-date";
      case EndPoints.deleteReservableDate:
        return "/client/delete-reservable-date";
      case EndPoints.createFeedback:
        return "/client/create-feedback";
      case EndPoints.logout:
        return "/auth/logout";
      case EndPoints.lessonDetail:
        return "/client/detail-lesson-tutor";
      case EndPoints.updateLesson:
        return "/client/update-lesson";
      case EndPoints.getNotifications:
        return "/client/notifications";
      case EndPoints.readAllNotification:
        return "/client/read-all-notifications";
      case EndPoints.registerFcmToken:
        return "/client/register-token-firebase";
    }
  }
}
