// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_info_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterInfoBlocState {
  RegisterInfoOutput? get registerInfoOutput =>
      throw _privateConstructorUsedError;
  CloudinaryResponse? get cloudinaryResponse =>
      throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  RegisterInfoStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterInfoBlocStateCopyWith<RegisterInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterInfoBlocStateCopyWith<$Res> {
  factory $RegisterInfoBlocStateCopyWith(RegisterInfoBlocState value,
          $Res Function(RegisterInfoBlocState) then) =
      _$RegisterInfoBlocStateCopyWithImpl<$Res, RegisterInfoBlocState>;
  @useResult
  $Res call(
      {RegisterInfoOutput? registerInfoOutput,
      CloudinaryResponse? cloudinaryResponse,
      ErrorObject? errorObject,
      RegisterInfoStatus status});
}

/// @nodoc
class _$RegisterInfoBlocStateCopyWithImpl<$Res,
        $Val extends RegisterInfoBlocState>
    implements $RegisterInfoBlocStateCopyWith<$Res> {
  _$RegisterInfoBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerInfoOutput = freezed,
    Object? cloudinaryResponse = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      registerInfoOutput: freezed == registerInfoOutput
          ? _value.registerInfoOutput
          : registerInfoOutput // ignore: cast_nullable_to_non_nullable
              as RegisterInfoOutput?,
      cloudinaryResponse: freezed == cloudinaryResponse
          ? _value.cloudinaryResponse
          : cloudinaryResponse // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterInfoStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterInfoBlocStateCopyWith<$Res>
    implements $RegisterInfoBlocStateCopyWith<$Res> {
  factory _$$_RegisterInfoBlocStateCopyWith(_$_RegisterInfoBlocState value,
          $Res Function(_$_RegisterInfoBlocState) then) =
      __$$_RegisterInfoBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterInfoOutput? registerInfoOutput,
      CloudinaryResponse? cloudinaryResponse,
      ErrorObject? errorObject,
      RegisterInfoStatus status});
}

/// @nodoc
class __$$_RegisterInfoBlocStateCopyWithImpl<$Res>
    extends _$RegisterInfoBlocStateCopyWithImpl<$Res, _$_RegisterInfoBlocState>
    implements _$$_RegisterInfoBlocStateCopyWith<$Res> {
  __$$_RegisterInfoBlocStateCopyWithImpl(_$_RegisterInfoBlocState _value,
      $Res Function(_$_RegisterInfoBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerInfoOutput = freezed,
    Object? cloudinaryResponse = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_RegisterInfoBlocState(
      registerInfoOutput: freezed == registerInfoOutput
          ? _value.registerInfoOutput
          : registerInfoOutput // ignore: cast_nullable_to_non_nullable
              as RegisterInfoOutput?,
      cloudinaryResponse: freezed == cloudinaryResponse
          ? _value.cloudinaryResponse
          : cloudinaryResponse // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegisterInfoStatus,
    ));
  }
}

/// @nodoc

class _$_RegisterInfoBlocState implements _RegisterInfoBlocState {
  const _$_RegisterInfoBlocState(
      {required this.registerInfoOutput,
      required this.cloudinaryResponse,
      required this.errorObject,
      required this.status});

  @override
  final RegisterInfoOutput? registerInfoOutput;
  @override
  final CloudinaryResponse? cloudinaryResponse;
  @override
  final ErrorObject? errorObject;
  @override
  final RegisterInfoStatus status;

  @override
  String toString() {
    return 'RegisterInfoBlocState(registerInfoOutput: $registerInfoOutput, cloudinaryResponse: $cloudinaryResponse, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterInfoBlocState &&
            (identical(other.registerInfoOutput, registerInfoOutput) ||
                other.registerInfoOutput == registerInfoOutput) &&
            (identical(other.cloudinaryResponse, cloudinaryResponse) ||
                other.cloudinaryResponse == cloudinaryResponse) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, registerInfoOutput, cloudinaryResponse, errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterInfoBlocStateCopyWith<_$_RegisterInfoBlocState> get copyWith =>
      __$$_RegisterInfoBlocStateCopyWithImpl<_$_RegisterInfoBlocState>(
          this, _$identity);
}

abstract class _RegisterInfoBlocState implements RegisterInfoBlocState {
  const factory _RegisterInfoBlocState(
      {required final RegisterInfoOutput? registerInfoOutput,
      required final CloudinaryResponse? cloudinaryResponse,
      required final ErrorObject? errorObject,
      required final RegisterInfoStatus status}) = _$_RegisterInfoBlocState;

  @override
  RegisterInfoOutput? get registerInfoOutput;
  @override
  CloudinaryResponse? get cloudinaryResponse;
  @override
  ErrorObject? get errorObject;
  @override
  RegisterInfoStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterInfoBlocStateCopyWith<_$_RegisterInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
