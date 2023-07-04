// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordBlocState {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  ResetPasswordStatus get blocStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordBlocStateCopyWith<ResetPasswordBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordBlocStateCopyWith<$Res> {
  factory $ResetPasswordBlocStateCopyWith(ResetPasswordBlocState value,
          $Res Function(ResetPasswordBlocState) then) =
      _$ResetPasswordBlocStateCopyWithImpl<$Res, ResetPasswordBlocState>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      ResetPasswordStatus blocStatus});
}

/// @nodoc
class _$ResetPasswordBlocStateCopyWithImpl<$Res,
        $Val extends ResetPasswordBlocState>
    implements $ResetPasswordBlocStateCopyWith<$Res> {
  _$ResetPasswordBlocStateCopyWithImpl(this._value, this._then);

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
    Object? blocStatus = null,
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
      blocStatus: null == blocStatus
          ? _value.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordBlocStateCopyWith<$Res>
    implements $ResetPasswordBlocStateCopyWith<$Res> {
  factory _$$_ResetPasswordBlocStateCopyWith(_$_ResetPasswordBlocState value,
          $Res Function(_$_ResetPasswordBlocState) then) =
      __$$_ResetPasswordBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      ErrorObject? errorObject,
      ResetPasswordStatus blocStatus});
}

/// @nodoc
class __$$_ResetPasswordBlocStateCopyWithImpl<$Res>
    extends _$ResetPasswordBlocStateCopyWithImpl<$Res,
        _$_ResetPasswordBlocState>
    implements _$$_ResetPasswordBlocStateCopyWith<$Res> {
  __$$_ResetPasswordBlocStateCopyWithImpl(_$_ResetPasswordBlocState _value,
      $Res Function(_$_ResetPasswordBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? errorObject = freezed,
    Object? blocStatus = null,
  }) {
    return _then(_$_ResetPasswordBlocState(
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
      blocStatus: null == blocStatus
          ? _value.blocStatus
          : blocStatus // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordBlocState implements _ResetPasswordBlocState {
  const _$_ResetPasswordBlocState(
      {required this.status,
      required this.message,
      required this.errorObject,
      required this.blocStatus});

  @override
  final int? status;
  @override
  final String? message;
  @override
  final ErrorObject? errorObject;
  @override
  final ResetPasswordStatus blocStatus;

  @override
  String toString() {
    return 'ResetPasswordBlocState(status: $status, message: $message, errorObject: $errorObject, blocStatus: $blocStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordBlocState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.blocStatus, blocStatus) ||
                other.blocStatus == blocStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, errorObject, blocStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordBlocStateCopyWith<_$_ResetPasswordBlocState> get copyWith =>
      __$$_ResetPasswordBlocStateCopyWithImpl<_$_ResetPasswordBlocState>(
          this, _$identity);
}

abstract class _ResetPasswordBlocState implements ResetPasswordBlocState {
  const factory _ResetPasswordBlocState(
          {required final int? status,
          required final String? message,
          required final ErrorObject? errorObject,
          required final ResetPasswordStatus blocStatus}) =
      _$_ResetPasswordBlocState;

  @override
  int? get status;
  @override
  String? get message;
  @override
  ErrorObject? get errorObject;
  @override
  ResetPasswordStatus get blocStatus;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordBlocStateCopyWith<_$_ResetPasswordBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
