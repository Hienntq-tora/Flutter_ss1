import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'tutor_update_info_bloc_state.freezed.dart';

enum TutorUpdateInfoStatus {
  initial,
  loading,
  loadFailure,
  uploadImageSuccess,
  updateInfoSuccess,
}

@freezed
class TutorUpdateInfoBlocState with _$TutorUpdateInfoBlocState {
  const factory TutorUpdateInfoBlocState({
    required CloudinaryResponse? uploadImageOutput,
    required DefaultOutput? updateInfoOutput,
    required ErrorObject? errorObject,
    required TutorUpdateInfoStatus status,
  }) = _TutorUpdateInfoBlocState;

  factory TutorUpdateInfoBlocState.initial() => const TutorUpdateInfoBlocState(
        uploadImageOutput: null,
        updateInfoOutput: null,
        errorObject: null,
        status: TutorUpdateInfoStatus.initial,
      );
}
