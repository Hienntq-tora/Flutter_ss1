import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_tracker/core/environment.dart';
import 'package:time_tracker/core/network.dart';
import 'package:time_tracker/core/services/fcm_service.dart';
import 'package:time_tracker/core/services/local_notification_service.dart';
import 'package:time_tracker/core/services/shipbook_service.dart';
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/repositories/app_repository_impl.dart';
import 'package:time_tracker/domain/repositories/cloudinarry_repository_impl.dart';
import 'package:time_tracker/domain/repositories/cloudinary_repository.dart';
import 'package:time_tracker/domain/usecases/change_password_use_case.dart';
import 'package:time_tracker/domain/usecases/cloudinary_usecase.dart';
import 'package:time_tracker/domain/usecases/create_booking_use_case.dart';
import 'package:time_tracker/domain/usecases/delete_reservable_date_use_case.dart';
import 'package:time_tracker/domain/usecases/delete_tutor_lesson_usecase.dart';
import 'package:time_tracker/domain/usecases/get_lessons_by_tutor_usecase.dart';
import 'package:time_tracker/domain/usecases/get_reservable_date_use_case.dart';
import 'package:time_tracker/domain/usecases/get_tutor_reservable_dates_usecase.dart';
import 'package:time_tracker/domain/usecases/get_schedule_list_use_case.dart';
import 'package:time_tracker/domain/usecases/lesson_detail_usecase.dart';
import 'package:time_tracker/domain/usecases/lesson_history_usecase.dart';
import 'package:time_tracker/domain/usecases/list_field_usecase.dart';
import 'package:time_tracker/domain/usecases/login_usecase.dart';
import 'package:time_tracker/domain/usecases/logout_usecase.dart';
import 'package:time_tracker/domain/usecases/post_comment_usecase.dart';
import 'package:time_tracker/domain/usecases/post_report_usecase.dart';
import 'package:time_tracker/domain/usecases/read_all_notification_usecase.dart';
import 'package:time_tracker/domain/usecases/register_fcm_token_use_case.dart';
import 'package:time_tracker/domain/usecases/register_info_usecase.dart';
import 'package:time_tracker/domain/usecases/resend_verify_otp_usecase.dart';
import 'package:time_tracker/domain/usecases/reset_password_usecase.dart';
import 'package:time_tracker/domain/usecases/search_lesson_usecase.dart';
import 'package:time_tracker/domain/usecases/search_tutor_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_appointment_list_use_case.dart';
import 'package:time_tracker/domain/usecases/tutor_cancel_appointment_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_feedback_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_lesson_usecase.dart';
import 'package:time_tracker/domain/usecases/tutor_notification_usecase.dart';
import 'package:time_tracker/domain/usecases/update_information_usecase.dart';
import 'package:time_tracker/domain/usecases/update_lesson_usecase.dart';
import 'package:time_tracker/domain/usecases/update_reservable_date_use_case.dart';
import 'package:time_tracker/domain/usecases/verify_otp_use_case.dart';
import 'package:time_tracker/routes/route.dart';
import 'package:time_tracker/ui/screens/comment/comment_cubit.dart';
import 'package:time_tracker/ui/screens/create_account/enter_information/register_info_cubit.dart';
import 'package:time_tracker/ui/screens/create_account/enter_otp/create_account_enter_otp_cubit.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_email/request_otp_cubit.dart';
import 'package:time_tracker/ui/screens/forgot_password/enter_otp/forgot_password_enter_otp_cubit.dart';
import 'package:time_tracker/ui/screens/forgot_password/reset_password/reset_password_cubit.dart';
import 'package:time_tracker/ui/screens/lesson_history/lesson_history_cubit.dart';
import 'package:time_tracker/ui/screens/login/auth_cubit.dart';
import 'package:time_tracker/ui/screens/report/repport_cubit.dart';
import 'package:time_tracker/ui/screens/search_lesson/search_lesson_cubit.dart';
import 'package:time_tracker/ui/screens/search_tutor/search_tutor_cubit.dart';
import 'package:time_tracker/ui/screens/student_home/student_home_cubit.dart';
import 'package:time_tracker/ui/screens/student_tutor_available_time/create_booking_cubit.dart';
import 'package:time_tracker/ui/screens/student_tutor_lessons/get_lessons_by_tutor_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_feedback/tutor_feedback_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_lesson/tutor_lesson_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/update_lesson_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_update_information/tutor_update_info_cubit.dart';
import 'package:time_tracker/ui/screens/tutor_notification/tutor_notification_cubit.dart';
import 'package:time_tracker/ui/screens/update_information/update_info_cubit.dart';
import 'package:time_tracker/ui/screens/update_schedule/update_schedule_cubit.dart';

import '../../data/resources/remote_data_resource.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../domain/usecases/tutor_detail_usecase.dart';
import '../../ui/screens/change_password/change_password_cubit.dart';
import '../../ui/screens/tutor_detail/tutor_detail_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Shared prefs
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);

  // Environment Manager
  sl.registerLazySingleton<EnvironmentManager>(() => EnvironmentManager());

  // Network manager
  sl.registerLazySingleton<NetworkManager>(
    () => NetworkManager(),
  );

  // Local data source
  sl.registerLazySingleton<LocalDataResource>(() => LocalDataResource(sl()));

  // Remote data source
  sl.registerLazySingleton<RemoteDataResource>(
    () => RemoteDataResource(sl()),
  );

  // Cloudinary
  final cloudName = await sl<EnvironmentManager>().cloudName;
  sl.registerLazySingleton<Cloudinary>(
    () => Cloudinary.basic(cloudName: cloudName),
  );

  // // Shipbook
  final shipBookAppId = await sl<EnvironmentManager>().shipBookAppId;
  final shipBookToken = await sl<EnvironmentManager>().shipBookToken;
  sl.registerLazySingleton<ShipBookService>(
    () => ShipBookService(
      shipBookAppId: shipBookAppId,
      shipBookToken: shipBookToken,
    ),
  );

  // Firebase
  sl.registerLazySingleton<AppRouter>(() => AppRouter(sl()));
  sl.registerLazySingleton<FcmService>(() => FcmService(sl()));
  sl.registerLazySingleton<LocalNotificationService>(
      () => LocalNotificationService());

  // Repository
  sl.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(sl(), sl()),
  );

  sl.registerFactory<CloudinaryRepository>(
    () => CloudinaryRepositoryImpl(sl(), sl(), sl()),
  );

  // Use case
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerFactory(() => RegisterInfoUseCase(sl()));
  sl.registerFactory(() => CloudinaryUseCase(sl()));
  sl.registerFactory(() => ResendVerifyOtpUseCase(sl()));
  sl.registerFactory(() => VerifyOtpUseCase(sl()));
  sl.registerFactory(() => HomeUseCase(sl()));
  sl.registerFactory(() => SearchLessonUseCase(sl()));
  sl.registerFactory(() => SearchTutorUseCase(sl()));

  sl.registerFactory(() => ResetPasswordUseCase(sl()));
  sl.registerFactory(() => LessonHistoryUseCase(sl()));
  sl.registerFactory(() => TutorDetailUseCase(sl()));
  sl.registerFactory(() => PostCommentUseCase(sl()));
  sl.registerFactory(() => PostReportUsecase(sl()));
  sl.registerFactory(() => GetReservableDateUseCase(sl()));
  sl.registerFactory(() => CreateBookingUseCase(sl()));
  sl.registerFactory(() => GetLessonsByTutorUseCase(sl()));
  sl.registerFactory(() => UpdateInformationUseCase(sl()));
  sl.registerFactory(() => ChangePasswordUseCase(sl()));
  sl.registerFactory(() => TutorAppointmentListUseCase(sl()));
  sl.registerFactory(() => TutorCancelAppointmentUseCase(sl()));
  sl.registerFactory(() => TutorLessonUseCase(sl()));
  sl.registerFactory(() => DeleteTutorLessonUseCase(sl()));
  sl.registerFactory(() => GetTutorReservableDatesUseCase(sl()));
  sl.registerFactory(() => GetScheduleListUseCase(sl()));
  sl.registerFactory(() => UpdateReservableDateUseCase(sl()));
  sl.registerFactory(() => DeleteReservableDateUseCase(sl()));
  sl.registerFactory(() => ListFieldUseCase(sl()));
  sl.registerFactory(() => LessonDetailUseCase(sl()));
  sl.registerFactory(() => UpdateLessonUseCase(sl()));
  sl.registerFactory(() => TutorFeedbackUseCase(sl()));
  sl.registerFactory(() => TutorNotificationUseCase(sl()));
  sl.registerFactory(() => ReadAllNotificationUseCase(sl()));
  sl.registerFactory(() => RegisterFcmTokenUseCase(sl()));

  // Cubit
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory<RegisterInfoCubit>(() => RegisterInfoCubit(sl(), sl()));
  sl.registerFactory<TutorFeedbackCubit>(() => TutorFeedbackCubit(sl()));
  sl.registerFactory<CreateAccountEnterOtpCubit>(
    () => CreateAccountEnterOtpCubit(sl(), sl()),
  );
  sl.registerFactory<ForgotPasswordEnterOtpCubit>(
    () => ForgotPasswordEnterOtpCubit(sl(), sl()),
  );
  sl.registerFactory<RequestOtpCubit>(
    () => RequestOtpCubit(sl()),
  );
  sl.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(sl()),
  );
  sl.registerFactory<StudentHomeCubit>(
    () => StudentHomeCubit(sl()),
  );
  sl.registerFactory<SearchLessonCubit>(
    () => SearchLessonCubit(sl()),
  );
  sl.registerFactory<LessonHistoryCubit>(
    () => LessonHistoryCubit(sl()),
  );
  sl.registerFactory<SearchTutorCubit>(() => SearchTutorCubit(sl()));
  sl.registerFactory<TutorDetailCubit>(() => TutorDetailCubit(sl()));
  sl.registerFactory<PostCommentCubit>(() => PostCommentCubit(sl()));
  sl.registerFactory<PostReportCubit>(() => PostReportCubit(sl()));
  sl.registerFactory<CreateBookingCubit>(
    () => CreateBookingCubit(sl(), sl()),
  );
  sl.registerFactory<GetLessonsByTutorCubit>(
    () => GetLessonsByTutorCubit(sl()),
  );
  sl.registerFactory<UpdateInfoCubit>(
    () => UpdateInfoCubit(sl(), sl()),
  );
  sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(sl()));
  sl.registerFactory<TutorHomeCubit>(
    () => TutorHomeCubit(sl(), sl(), sl(), sl()),
  );
  sl.registerFactory<TutorLessonCubit>(() => TutorLessonCubit(sl(), sl()));
  sl.registerFactory<UpdateScheduleCubit>(
    () => UpdateScheduleCubit(sl(), sl(), sl()),
  );
  sl.registerFactory<UpdateLessonCubit>(
      () => UpdateLessonCubit(sl(), sl(), sl(), sl()));

  sl.registerFactory<TutorUpdateInfoCubit>(
    () => TutorUpdateInfoCubit(sl(), sl()),
  );
  sl.registerFactory<TutorNotificationCubit>(
    () => TutorNotificationCubit(sl(), sl()),
  );
}
