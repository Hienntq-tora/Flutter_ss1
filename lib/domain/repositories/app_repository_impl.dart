import 'package:flutter/material.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/data/resources/mappers/change_password_mapper.dart';
import 'package:time_tracker/data/resources/mappers/create_booking_mapper.dart';
import 'package:time_tracker/data/resources/mappers/delete_tutor_lesson_mapper.dart';
import 'package:time_tracker/data/resources/mappers/enter_otp_mapper.dart';
import 'package:time_tracker/data/resources/mappers/field_mapper.dart';
import 'package:time_tracker/data/resources/mappers/update_lesson_mapper.dart';
import 'package:time_tracker/data/resources/mappers/tutor_feedback_mapper.dart';
import 'package:time_tracker/data/resources/mappers/update_schedule_mapper.dart';
import 'package:time_tracker/data/resources/mappers/lesson_history_mapper.dart';
import 'package:time_tracker/data/resources/mappers/lesson_mapper.dart';
import 'package:time_tracker/data/resources/mappers/login_mapper.dart';
import 'package:time_tracker/data/resources/mappers/post_comment_mapper.dart';
import 'package:time_tracker/data/resources/mappers/post_report_mapper.dart';
import 'package:time_tracker/data/resources/mappers/register_fcm_token_mapper.dart';
import 'package:time_tracker/data/resources/mappers/register_info_mapper.dart';
import 'package:time_tracker/data/resources/mappers/reservable_date_mapper.dart';
import 'package:time_tracker/data/resources/mappers/reset_password_mapper.dart';
import 'package:time_tracker/data/resources/mappers/tutor_appointments_mapper.dart';
import 'package:time_tracker/data/resources/mappers/tutor_detail_mapper.dart';
import 'package:time_tracker/data/resources/mappers/tutor_mapper.dart';
import 'package:time_tracker/data/resources/mappers/tutor_notification_mapper.dart';
import 'package:time_tracker/data/resources/mappers/update_information_mapper.dart';
import 'package:time_tracker/domain/entities/change_password_input.dart';
import 'package:time_tracker/domain/entities/create_booking_output.dart';
import 'package:time_tracker/domain/entities/create_booking_input.dart';
import 'package:time_tracker/domain/entities/delete_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/delete_tutor_leson_input.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/entities/get_lessons_by_tutor_input.dart';
import 'package:time_tracker/domain/entities/get_lessons_input.dart';
import 'package:time_tracker/domain/entities/get_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/get_schedule_list_input.dart';
import 'package:time_tracker/domain/entities/get_tutors_input.dart';
import 'package:time_tracker/domain/entities/local_user_data.dart';
import 'package:time_tracker/domain/entities/post_comment_input.dart';
import 'package:time_tracker/domain/entities/post_report_input.dart';
import 'package:time_tracker/domain/entities/register_fcm_token_input.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';
import 'package:time_tracker/domain/entities/tutor.dart';
import 'package:time_tracker/domain/entities/lesson.dart';
import 'package:time_tracker/domain/entities/lesson_history_output.dart';
import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';
import 'package:time_tracker/domain/entities/register_info_input.dart';
import 'package:time_tracker/domain/entities/register_info_output.dart';
import 'package:time_tracker/domain/entities/reset_password_input.dart';
import 'package:time_tracker/domain/entities/tutor_appointments_input.dart';
import 'package:time_tracker/domain/entities/tutor_appointment.dart';
import 'package:time_tracker/domain/entities/tutor_detail_input.dart';
import 'package:time_tracker/domain/entities/tutor_feedback_input.dart';
import 'package:time_tracker/domain/entities/tutor_notification.dart';
import 'package:time_tracker/domain/entities/update_information_input.dart';
import 'package:time_tracker/domain/entities/update_lesson_input.dart';
import 'package:time_tracker/domain/entities/update_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/verify_otp_input.dart';

import '../../data/errors/http_error.dart';
import '../../data/resources/api_enum.dart';
import '../../data/resources/remote_data_resource.dart';
import '../entities/default_output.dart';
import '../entities/lesson_detail_input.dart';
import '../entities/resend_verify_otp_input.dart';
import '../errors/domain_error.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl(this.localDataResource, this.remoteDataResource);

  final RemoteDataResource remoteDataResource;
  final LocalDataResource localDataResource;

  @override
  void setToken(String token) {
    localDataResource.setAccessToken(token);
  }

  @override
  void setRefreshToken(String refreshToken) {
    localDataResource.setRefreshToken(refreshToken);
  }

  @override
  void setUserData(LocalUserData data) {
    localDataResource.setUserData(data);
  }

  @override
  void setFcmRefreshToken(String fcmRefreshToken) {
    localDataResource.setFcmRefreshToken(fcmRefreshToken);
  }

  @override
  void clearFcmRefreshToken() {
    localDataResource.clearFcmRefreshToken();
  }

  @override
  String getFcmRefreshToken() {
    return localDataResource.getFcmRefreshToken();
  }

  @override
  Future<LoginOutput> loginWithGoogle(LoginInput input) async {
    try {
      final response = await remoteDataResource.login(input.toDto());
      return response.data.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd001);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  String getToken() {
    return localDataResource.getAccessToken();
  }

  @override
  LocalUserData getUserData() {
    return localDataResource.getUserData();
  }

  @override
  void clearRefreshToken() {
    localDataResource.clearRefreshToken();
  }

  @override
  void clearToken() {
    localDataResource.clearAccessToken();
  }

  @override
  void clearUserData() {
    localDataResource.clearUserData();
  }

  @override
  Future<RegisterInfoOutput> registerInfo(RegisterInfoInput input) async {
    try {
      final response = await remoteDataResource.registerInfo(input.toDto());
      return response.data.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd002);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> resendVerifyOtp(ResendVerifyOtpInput input) async {
    try {
      final response = await remoteDataResource.resendVerifyOtp(
        input.toDto(),
        input.path,
      );
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd003);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> verifyOtp(VerifyOtpInput input) async {
    try {
      final response = await remoteDataResource.verifyOtp(
        input.toDto(),
        input.path,
      );
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd004);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> resetPassword(ResetPasswordInput input) async {
    try {
      final response = await remoteDataResource.resetPassword(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Lesson>> getLessons(GetLessonsInput input) async {
    try {
      final response = await remoteDataResource.getLessons(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd006);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Field>> getFields() async {
    try {
      final response = await remoteDataResource.getFields();
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd007);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<LessonHistoryOutput>> getLessonHistory() async {
    try {
      final response = await remoteDataResource.getLessonHistory();
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Tutor>> getTutors(GetTutorsInput input) async {
    try {
      final response = await remoteDataResource.getTutors(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Tutor> getTutorDetail(GetTutorDetailInput input) async {
    try {
      final response = await remoteDataResource.getTutorDetail(input.toDto());
      return response.data.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError();
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> postCommentLesson(PostCommentInput input) async {
    try {
      final response =
          await remoteDataResource.postCommentLesson(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> postReport(PostReportInput input) async {
    try {
      final response = await remoteDataResource.postReport(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ReservableDate>> getReservableDate(
      GetReservableDateInput input) async {
    try {
      final response =
          await remoteDataResource.getReservableDate(input.toDto());
      return response.data.toEntityList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<CreateBookingOutput> createBooking(CreateBookingInput input) async {
    try {
      final response = await remoteDataResource.createBooking(input.toDto());
      return response.data.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> sendFeedback(TutorFeedbackInput input) async {
    try {
      final response = await remoteDataResource.sendFeedback(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Lesson>> getLessonsByTutor(GetLessonsByTutorInput input) async {
    try {
      final response =
          await remoteDataResource.getLessonsByTutorInput(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd006);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Lesson>> getTutorLessons() async {
    try {
      final response = await remoteDataResource.getTutorLessons();
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd006);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<TutorNotification>> getTutorNotification() async {
    try {
      final response = await remoteDataResource.getTutorNotification();
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd006);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> readAllNotification() async {
    try {
      final response = await remoteDataResource.readAllNotification();
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> registerFcmToken(RegisterFcmTokenInput input) async {
    try {
      final response = await remoteDataResource.registerFcmToken(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> deleteTutorLessons(DeleteTutorLessonInput input) async {
    try {
      final response =
          await remoteDataResource.deleteTutorLessons(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd006);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> updateInformation(UpdateInformationInput input) async {
    try {
      final response =
          await remoteDataResource.updateInformation(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> changePassword(ChangePasswordInput input) async {
    try {
      final response = await remoteDataResource.changePassword(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<TutorAppointment>> tutorAppoinmentList(
      TutorAppointmentInput input) async {
    try {
      final response =
          await remoteDataResource.tutorAppoinmentList(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> tutorCancelAppointment(
      TutorCancelAppointmentInput input) async {
    try {
      final response = await remoteDataResource.tutorCancelAppointment(
        input.appointmentId,
        input.toDto(),
      );
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.unknown);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ReservableDate>> getTutorReservableDates(
      TutorAppointmentInput input) async {
    try {
      final response =
          await remoteDataResource.getTutorReservableDates(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ReservableDate>> getScheduleList(
      GetScheduleListInput input) async {
    try {
      final response = await remoteDataResource.scheduleList(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ReservableDate>> updateReservableDate(
      UpdateReservableDateInput input) async {
    try {
      final response =
          await remoteDataResource.updateReservableDate(input.toDto());
      return response.data.map((e) => e.toEntity()).toList();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.ihd005);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> deleteReservableDate(
      DeleteReservableDateInput input) async {
    try {
      final response = await remoteDataResource.deleteReservableDate(
        input.toDto(),
      );
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.unknown);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> logout() async {
    try {
      final response = await remoteDataResource.logout();
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.unknown);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<Lesson> lessonDetail(LessonDetailInput input) async {
    try {
      final response = await remoteDataResource.lessonDetail(input.toDto());
      return response.data.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.unknown);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<DefaultOutput> updateLesson(UpdateLessonInput input) async {
    try {
      final response = await remoteDataResource.updateLesson(input.toDto());
      return response.toEntity();
    } on HttpError catch (e) {
      debugPrint(e.toString());
      throw e.convertError(api: ApiEnum.unknown);
    } on DomainError catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
