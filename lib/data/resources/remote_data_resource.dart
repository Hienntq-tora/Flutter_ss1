import 'package:time_tracker/data/resources/enums/end_points.dart';
import 'package:time_tracker/data/resources/models/change_password_request.dart';
import 'package:time_tracker/data/resources/models/comment_request.dart';
import 'package:time_tracker/data/resources/models/create_booking_request.dart';
import 'package:time_tracker/data/resources/models/create_booking_response.dart';
import 'package:time_tracker/data/resources/models/delete_reservable_date_request.dart';
import 'package:time_tracker/data/resources/models/delete_tutor_lesson_request.dart';
import 'package:time_tracker/data/resources/models/field_dto.dart';
import 'package:time_tracker/data/resources/models/get_lessons_by_tutor_request.dart';
import 'package:time_tracker/data/resources/models/get_lessons_request.dart';
import 'package:time_tracker/data/resources/models/get_reservable_date_request.dart';
import 'package:time_tracker/data/resources/models/get_schedule_list_request.dart';
import 'package:time_tracker/data/resources/models/get_tutors_request.dart';
import 'package:time_tracker/data/resources/models/lesson_detail_request.dart';
import 'package:time_tracker/data/resources/models/lesson_history_response.dart';
import 'package:time_tracker/data/resources/models/login_request.dart';
import 'package:time_tracker/data/resources/models/login_response.dart';
import 'package:time_tracker/data/resources/models/register_fcm_token_request.dart';
import 'package:time_tracker/data/resources/models/register_info_request.dart';
import 'package:time_tracker/data/resources/models/register_info_response.dart';
import 'package:time_tracker/data/resources/models/report_request.dart';
import 'package:time_tracker/data/resources/models/resend_verify_otp_request.dart';
import 'package:time_tracker/data/resources/models/reservable_date_dto.dart';
import 'package:time_tracker/data/resources/models/reset_password_request.dart';
import 'package:time_tracker/data/resources/models/response_wrapper.dart';
import 'package:time_tracker/data/resources/models/tutor_appointment_request.dart';
import 'package:time_tracker/data/resources/models/tutor_appointment_response.dart';
import 'package:time_tracker/data/resources/models/tutor_cancel_appointment_request.dart';
import 'package:time_tracker/data/resources/models/tutor_detail_request.dart';
import 'package:time_tracker/data/resources/models/tutor_dto.dart';
import 'package:time_tracker/data/resources/models/tutor_feedback_request.dart';
import 'package:time_tracker/data/resources/models/tutor_notification_dto.dart';
import 'package:time_tracker/data/resources/models/update_information_request.dart';
import 'package:time_tracker/data/resources/models/update_lesson_request.dart';
import 'package:time_tracker/data/resources/models/update_reservable_date_request.dart';
import 'package:time_tracker/data/resources/models/verify_otp_request.dart';
import '../../core/network.dart';
import 'models/lesson_dto.dart';

class RemoteDataResource {
  const RemoteDataResource(this.networkManager);

  final NetworkManager networkManager;

  Future<ResponseWrapper<LoginResponse>> login(LoginRequest request) async {
    final response = await networkManager.request(
        RequestMethod.post, EndPoints.login.toPath,
        data: request.toJson());

    return ResponseWrapper.fromJson(response,
        (data) => LoginResponse.fromJson(data as Map<String, dynamic>));
  }

  Future<ResponseWrapper<RegisterInfoResponse>> registerInfo(
      RegisterInfoRequest request) async {
    final response = await networkManager.request(
        RequestMethod.post, EndPoints.registerInfo.toPath,
        data: request.toJson());

    return ResponseWrapper.fromJson(response,
        (data) => RegisterInfoResponse.fromJson(data as Map<String, dynamic>));
  }

  Future<ResponseWrapper> resendVerifyOtp(
      ResendVerifyOtpRequest request, String endPoint) async {
    final response = await networkManager.request(RequestMethod.post, endPoint,
        data: request.toJson());

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> verifyOtp(
      VerifyOtpRequest request, String endPoint) async {
    final response = await networkManager.request(RequestMethod.post, endPoint,
        data: request.toJson());

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> resetPassword(ResetPasswordRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.resetPassword.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper<List<LessonDto>>> getLessons(
      GetLessonsRequest request) async {
    final response = await networkManager.request(
        RequestMethod.get, EndPoints.getLessons.toPath,
        queryParameters: request.toJson());

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<List<LessonDto>>> getTutorLessons() async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.getTutorLessons.toPath,
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper> deleteTutorLessons(
      DeleteTutorLessonRequest request) async {
    final response = await networkManager.request(
      RequestMethod.delete,
      EndPoints.deleteTutorLessons.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper<List<FieldDto>>> getFields() async {
    final response = await networkManager.request(
        RequestMethod.get, EndPoints.getFields.toPath);

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => FieldDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<List<LessonHistoryResponse>>>
      getLessonHistory() async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.lessonHistory.toPath,
    );

    return ResponseWrapper.fromJson(response, (dataList) {
      return (dataList as List<dynamic>)
          .map((data) =>
              LessonHistoryResponse.fromJson(data as Map<String, dynamic>))
          .toList();
    });
  }

  Future<ResponseWrapper<List<TutorDto>>> getTutors(
      GetTutorsRequest request) async {
    final response = await networkManager.request(
        RequestMethod.get, EndPoints.getTutors.toPath,
        queryParameters: request.toJson());

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => TutorDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<TutorDto>> getTutorDetail(
      TutorDetailRequest request) async {
    final response = await networkManager.request(
        RequestMethod.get, EndPoints.getTutorDetail.toPath,
        queryParameters: request.toJson());

    return ResponseWrapper.fromJson(
        response, (data) => TutorDto.fromJson(data as Map<String, dynamic>));
  }

  Future<ResponseWrapper> postCommentLesson(CommentRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.postComment.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> postReport(ReportRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.postReport.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper<List<ReservableDateDto>>> getReservableDate(
      GetReservableDateRequest request) async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.getReservableDate.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => ReservableDateDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<CreateBookingResponse>> createBooking(
      CreateBookingRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.createBooking.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response,
        (data) => CreateBookingResponse.fromJson(data as Map<String, dynamic>));
  }

  Future<ResponseWrapper<List<LessonDto>>> getLessonsByTutorInput(
      GetLessonsByTutorRequest request) async {
    final response = await networkManager.request(
        RequestMethod.get, EndPoints.getLessons.toPath,
        queryParameters: request.toJson());

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper> updateInformation(
      UpdateInformationRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.updateUserInfo.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> changePassword(ChangePasswordRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.changePassword.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (data) => null);
  }

  Future<ResponseWrapper<List<TutorAppointmentResponse>>> tutorAppoinmentList(
      TutorAppointmentRequest request) async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.tutorAppointmentList.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) =>
                TutorAppointmentResponse.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper> tutorCancelAppointment(
    String appointmentId,
    TutorCancelAppointmentRequest request,
  ) async {
    final url = "${EndPoints.appointment.toPath}/$appointmentId";

    final response = await networkManager.request(
      RequestMethod.put,
      url,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper<List<ReservableDateDto>>> getTutorReservableDates(
    TutorAppointmentRequest request,
  ) async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.getReservableDate.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => ReservableDateDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<List<TutorNotificationDto>>>
      getTutorNotification() async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.getNotifications.toPath,
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map(
                (e) => TutorNotificationDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<List<ReservableDateDto>>> scheduleList(
      GetScheduleListRequest request) async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.getReservableDate.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => ReservableDateDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper<List<ReservableDateDto>>> updateReservableDate(
      UpdateReservableDateRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.createReservableDate.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(
        response,
        (data) => (data as List)
            .map((e) => ReservableDateDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Future<ResponseWrapper> deleteReservableDate(
    DeleteReservableDateRequest request,
  ) async {
    final response = await networkManager.request(
      RequestMethod.delete,
      EndPoints.deleteReservableDate.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> readAllNotification() async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.readAllNotification.toPath,
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> logout() async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.logout.toPath,
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper> registerFcmToken(
      RegisterFcmTokenRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.registerFcmToken.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }

  Future<ResponseWrapper<LessonDto>> lessonDetail(
      LessonDetailRequest request) async {
    final response = await networkManager.request(
      RequestMethod.get,
      EndPoints.lessonDetail.toPath,
      queryParameters: request.toJson(),
    );

    return ResponseWrapper.fromJson(
      response,
      (data) => LessonDto.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ResponseWrapper> updateLesson(UpdateLessonRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.updateLesson.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (data) => null);
  }

  Future<ResponseWrapper> sendFeedback(GetFeedbackRequest request) async {
    final response = await networkManager.request(
      RequestMethod.post,
      EndPoints.createFeedback.toPath,
      data: request.toJson(),
    );

    return ResponseWrapper.fromJson(response, (json) => null);
  }
}
