// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestOtpBlocState {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  RequestOtpStatus get requestOtpStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestOtpBlocStateCopyWith<RequestOtpBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpBlocStateCopyWith<$Res> {
  factory $RequestOtpBlocStateCopyWith(
          RequestOtpBlocState value, $Res Function(RequestOtpBlocState) then) =
      _$RequestOtpBlocStateCopyWithImpl<$Res, RequestOtpBlocState>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      RequestOtpStatus requestOtpStatus});
}

/// @nodoc
class _$RequestOtpBlocStateCopyWithImpl<$Res, $Val extends RequestOtpBlocState>
    implements $RequestOtpBlocStateCopyWith<$Res> {
  _$RequestOtpBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? errorObject = freezed,
    Object? requestOtpStatus = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      requestOtpStatus: null == requestOtpStatus
          ? _value.requestOtpStatus
          : requestOtpStatus // ignore: cast_nullable_to_non_nullable
              as RequestOtpStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestOtpBlocStateCopyWith<$Res>
    implements $RequestOtpBlocStateCopyWith<$Res> {
  factory _$$_RequestOtpBlocStateCopyWith(_$_RequestOtpBlocState value,
          $Res Function(_$_RequestOtpBlocState) then) =
      __$$_RequestOtpBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      RequestOtpStatus requestOtpStatus});
}

/// @nodoc
class __$$_RequestOtpBlocStateCopyWithImpl<$Res>
    extends _$RequestOtpBlocStateCopyWithImpl<$Res, _$_RequestOtpBlocState>
    implements _$$_RequestOtpBlocStateCopyWith<$Res> {
  __$$_RequestOtpBlocStateCopyWithImpl(_$_RequestOtpBlocState _value,
      $Res Function(_$_RequestOtpBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? errorObject = freezed,
    Object? requestOtpStatus = null,
  }) {
    return _then(_$_RequestOtpBlocState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      requestOtpStatus: null == requestOtpStatus
          ? _value.requestOtpStatus
          : requestOtpStatus // ignore: cast_nullable_to_non_nullable
              as RequestOtpStatus,
    ));
  }
}

/// @nodoc

class _$_RequestOtpBlocState implements _RequestOtpBlocState {
  const _$_RequestOtpBlocState(
      {required this.status,
      required this.message,
      required this.errorObject,
      required this.requestOtpStatus});

  @override
  final int? status;
  @override
  final String? message;
  @override
  final ErrorObject? errorObject;
  @override
  final RequestOtpStatus requestOtpStatus;

  @override
  String toString() {
    return 'RequestOtpBlocState(status: $status, message: $message, errorObject: $errorObject, requestOtpStatus: $requestOtpStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestOtpBlocState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.requestOtpStatus, requestOtpStatus) ||
                other.requestOtpStatus == requestOtpStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, errorObject, requestOtpStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestOtpBlocStateCopyWith<_$_RequestOtpBlocState> get copyWith =>
      __$$_RequestOtpBlocStateCopyWithImpl<_$_RequestOtpBlocState>(
          this, _$identity);
}

abstract class _RequestOtpBlocState implements RequestOtpBlocState {
  const factory _RequestOtpBlocState(
          {required final int? status,
          required final String? message,
          required final ErrorObject? errorObject,
          required final RequestOtpStatus requestOtpStatus}) =
      _$_RequestOtpBlocState;

  @override
  int? get status;
  @override
  String? get message;
  @override
  ErrorObject? get errorObject;
  @override
  RequestOtpStatus get requestOtpStatus;
  @override
  @JsonKey(ignore: true)
  _$$_RequestOtpBlocStateCopyWith<_$_RequestOtpBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
