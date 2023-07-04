// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateInfoBlocState {
  CloudinaryResponse? get uploadImageOutput =>
      throw _privateConstructorUsedError;
  DefaultOutput? get updateInfoOutput => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  UpdateInfoStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateInfoBlocStateCopyWith<UpdateInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoBlocStateCopyWith<$Res> {
  factory $UpdateInfoBlocStateCopyWith(
          UpdateInfoBlocState value, $Res Function(UpdateInfoBlocState) then) =
      _$UpdateInfoBlocStateCopyWithImpl<$Res, UpdateInfoBlocState>;
  @useResult
  $Res call(
      {CloudinaryResponse? uploadImageOutput,
      DefaultOutput? updateInfoOutput,
      ErrorObject? errorObject,
      UpdateInfoStatus status});
}

/// @nodoc
class _$UpdateInfoBlocStateCopyWithImpl<$Res, $Val extends UpdateInfoBlocState>
    implements $UpdateInfoBlocStateCopyWith<$Res> {
  _$UpdateInfoBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadImageOutput = freezed,
    Object? updateInfoOutput = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      uploadImageOutput: freezed == uploadImageOutput
          ? _value.uploadImageOutput
          : uploadImageOutput // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      updateInfoOutput: freezed == updateInfoOutput
          ? _value.updateInfoOutput
          : updateInfoOutput // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateInfoStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateInfoBlocStateCopyWith<$Res>
    implements $UpdateInfoBlocStateCopyWith<$Res> {
  factory _$$_UpdateInfoBlocStateCopyWith(_$_UpdateInfoBlocState value,
          $Res Function(_$_UpdateInfoBlocState) then) =
      __$$_UpdateInfoBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CloudinaryResponse? uploadImageOutput,
      DefaultOutput? updateInfoOutput,
      ErrorObject? errorObject,
      UpdateInfoStatus status});
}

/// @nodoc
class __$$_UpdateInfoBlocStateCopyWithImpl<$Res>
    extends _$UpdateInfoBlocStateCopyWithImpl<$Res, _$_UpdateInfoBlocState>
    implements _$$_UpdateInfoBlocStateCopyWith<$Res> {
  __$$_UpdateInfoBlocStateCopyWithImpl(_$_UpdateInfoBlocState _value,
      $Res Function(_$_UpdateInfoBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uploadImageOutput = freezed,
    Object? updateInfoOutput = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_UpdateInfoBlocState(
      uploadImageOutput: freezed == uploadImageOutput
          ? _value.uploadImageOutput
          : uploadImageOutput // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      updateInfoOutput: freezed == updateInfoOutput
          ? _value.updateInfoOutput
          : updateInfoOutput // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateInfoStatus,
    ));
  }
}

/// @nodoc

class _$_UpdateInfoBlocState implements _UpdateInfoBlocState {
  const _$_UpdateInfoBlocState(
      {required this.uploadImageOutput,
      required this.updateInfoOutput,
      required this.errorObject,
      required this.status});

  @override
  final CloudinaryResponse? uploadImageOutput;
  @override
  final DefaultOutput? updateInfoOutput;
  @override
  final ErrorObject? errorObject;
  @override
  final UpdateInfoStatus status;

  @override
  String toString() {
    return 'UpdateInfoBlocState(uploadImageOutput: $uploadImageOutput, updateInfoOutput: $updateInfoOutput, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfoBlocState &&
            (identical(other.uploadImageOutput, uploadImageOutput) ||
                other.uploadImageOutput == uploadImageOutput) &&
            (identical(other.updateInfoOutput, updateInfoOutput) ||
                other.updateInfoOutput == updateInfoOutput) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uploadImageOutput, updateInfoOutput, errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoBlocStateCopyWith<_$_UpdateInfoBlocState> get copyWith =>
      __$$_UpdateInfoBlocStateCopyWithImpl<_$_UpdateInfoBlocState>(
          this, _$identity);
}

abstract class _UpdateInfoBlocState implements UpdateInfoBlocState {
  const factory _UpdateInfoBlocState(
      {required final CloudinaryResponse? uploadImageOutput,
      required final DefaultOutput? updateInfoOutput,
      required final ErrorObject? errorObject,
      required final UpdateInfoStatus status}) = _$_UpdateInfoBlocState;

  @override
  CloudinaryResponse? get uploadImageOutput;
  @override
  DefaultOutput? get updateInfoOutput;
  @override
  ErrorObject? get errorObject;
  @override
  UpdateInfoStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoBlocStateCopyWith<_$_UpdateInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
