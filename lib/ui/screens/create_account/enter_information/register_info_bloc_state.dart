import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/domain/entities/register_info_output.dart';

part 'register_info_bloc_state.freezed.dart';

enum RegisterInfoStatus {
  initial,
  loading,
  unsignedUploadSuccess,
  registerInfoSuccess,
  failure,
}

@freezed
class RegisterInfoBlocState with _$RegisterInfoBlocState {
  const factory RegisterInfoBlocState({
    required RegisterInfoOutput? registerInfoOutput,
    required CloudinaryResponse? cloudinaryResponse,
    required ErrorObject? errorObject,
    required RegisterInfoStatus status,
  }) = _RegisterInfoBlocState;

  factory RegisterInfoBlocState.initial() => const RegisterInfoBlocState(
        registerInfoOutput: null,
        cloudinaryResponse: null,
        errorObject: null,
        status: RegisterInfoStatus.initial,
      );
}
