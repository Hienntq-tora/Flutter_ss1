import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/domain/entities/default_output.dart';

import '../../../core/error_handling/error_object.dart';

part 'update_info_bloc_state.freezed.dart';

enum UpdateInfoStatus {
  initial,
  loading,
  loadFailure,
  uploadImageSuccess,
  updateInfoSuccess,
}

@freezed
class UpdateInfoBlocState with _$UpdateInfoBlocState {
  const factory UpdateInfoBlocState({
    required CloudinaryResponse? uploadImageOutput,
    required DefaultOutput? updateInfoOutput,
    required ErrorObject? errorObject,
    required UpdateInfoStatus status,
  }) = _UpdateInfoBlocState;

  factory UpdateInfoBlocState.initial() => const UpdateInfoBlocState(
        uploadImageOutput: null,
        updateInfoOutput: null,
        errorObject: null,
        status: UpdateInfoStatus.initial,
      );
}
