import 'package:time_tracker/domain/entities/change_password_input.dart';
import 'package:time_tracker/domain/entities/create_booking_input.dart';
import 'package:time_tracker/domain/entities/create_booking_output.dart';
import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/delete_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/delete_tutor_leson_input.dart';
import 'package:time_tracker/domain/entities/get_lessons_by_tutor_input.dart';
import 'package:time_tracker/domain/entities/get_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/get_schedule_list_input.dart';
import 'package:time_tracker/domain/entities/get_tutors_input.dart';
import 'package:time_tracker/domain/entities/local_user_data.dart';
import 'package:time_tracker/domain/entities/post_comment_input.dart';
import 'package:time_tracker/domain/entities/post_report_input.dart';
import 'package:time_tracker/domain/entities/register_fcm_token_input.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/entities/tutor.dart';
import 'package:time_tracker/domain/entities/lesson_history_output.dart';
import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';
import 'package:time_tracker/domain/entities/register_info_input.dart';
import 'package:time_tracker/domain/entities/register_info_output.dart';
import 'package:time_tracker/domain/entities/reset_password_input.dart';
import 'package:time_tracker/domain/entities/tutor_appointment.dart';
import 'package:time_tracker/domain/entities/tutor_appointments_input.dart';
import 'package:time_tracker/domain/entities/tutor_feedback_input.dart';
import 'package:time_tracker/domain/entities/tutor_notification.dart';
import 'package:time_tracker/domain/entities/update_information_input.dart';
import 'package:time_tracker/domain/entities/update_lesson_input.dart';
import 'package:time_tracker/domain/entities/update_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/verify_otp_input.dart';
import '../entities/field.dart';
import '../entities/get_lessons_input.dart';
import '../entities/lesson.dart';
import '../entities/lesson_detail_input.dart';
import '../entities/resend_verify_otp_input.dart';
import '../entities/tutor_detail_input.dart';

abstract class AppRepository {
  String getToken();

  void setToken(String token);

  void clearToken();

  void setRefreshToken(String refreshToken);

  void clearRefreshToken();

  LocalUserData getUserData();

  void setUserData(LocalUserData data);

  void clearUserData();

  void setFcmRefreshToken(String fcmRefreshToken);

  void clearFcmRefreshToken();

  String getFcmRefreshToken();

  Future<LoginOutput> loginWithGoogle(LoginInput input);

  Future<RegisterInfoOutput> registerInfo(RegisterInfoInput input);

  Future<DefaultOutput> resendVerifyOtp(ResendVerifyOtpInput input);

  Future<DefaultOutput> verifyOtp(VerifyOtpInput input);

  Future<DefaultOutput> resetPassword(ResetPasswordInput input);

  Future<List<Lesson>> getLessons(GetLessonsInput input);

  Future<List<Lesson>> getTutorLessons();

  Future<DefaultOutput> deleteTutorLessons(DeleteTutorLessonInput input);

  Future<List<Field>> getFields();

  Future<List<LessonHistoryOutput>> getLessonHistory();

  Future<List<Tutor>> getTutors(GetTutorsInput input);

  Future<Tutor> getTutorDetail(GetTutorDetailInput input);
  Future<DefaultOutput> postCommentLesson(PostCommentInput input);

  Future<DefaultOutput> postReport(PostReportInput input);

  Future<List<ReservableDate>> getReservableDate(GetReservableDateInput input);

  Future<CreateBookingOutput> createBooking(CreateBookingInput input);

  Future<DefaultOutput> sendFeedback(TutorFeedbackInput input);

  Future<List<Lesson>> getLessonsByTutor(GetLessonsByTutorInput input);

  Future<DefaultOutput> updateInformation(UpdateInformationInput input);

  Future<DefaultOutput> changePassword(ChangePasswordInput input);

  Future<List<TutorAppointment>> tutorAppoinmentList(
      TutorAppointmentInput input);

  Future<DefaultOutput> tutorCancelAppointment(
      TutorCancelAppointmentInput input);

  Future<List<ReservableDate>> getTutorReservableDates(
      TutorAppointmentInput input);

  Future<List<ReservableDate>> getScheduleList(GetScheduleListInput input);

  Future<List<ReservableDate>> updateReservableDate(
      UpdateReservableDateInput input);

  Future<DefaultOutput> deleteReservableDate(DeleteReservableDateInput input);

  Future<DefaultOutput> logout();

  Future<Lesson> lessonDetail(LessonDetailInput input);

  Future<DefaultOutput> updateLesson(UpdateLessonInput input);
  Future<List<TutorNotification>> getTutorNotification();
  Future<DefaultOutput> readAllNotification();

  Future<DefaultOutput> registerFcmToken(RegisterFcmTokenInput input);
}
