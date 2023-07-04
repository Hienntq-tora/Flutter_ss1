// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePasswordBlocState {
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  ChangePasswordStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordBlocStateCopyWith<ChangePasswordBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordBlocStateCopyWith<$Res> {
  factory $ChangePasswordBlocStateCopyWith(ChangePasswordBlocState value,
          $Res Function(ChangePasswordBlocState) then) =
      _$ChangePasswordBlocStateCopyWithImpl<$Res, ChangePasswordBlocState>;
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      ChangePasswordStatus status});
}

/// @nodoc
class _$ChangePasswordBlocStateCopyWithImpl<$Res,
        $Val extends ChangePasswordBlocState>
    implements $ChangePasswordBlocStateCopyWith<$Res> {
  _$ChangePasswordBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChangePasswordStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangePasswordBlocStateCopyWith<$Res>
    implements $ChangePasswordBlocStateCopyWith<$Res> {
  factory _$$_ChangePasswordBlocStateCopyWith(_$_ChangePasswordBlocState value,
          $Res Function(_$_ChangePasswordBlocState) then) =
      __$$_ChangePasswordBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      ChangePasswordStatus status});
}

/// @nodoc
class __$$_ChangePasswordBlocStateCopyWithImpl<$Res>
    extends _$ChangePasswordBlocStateCopyWithImpl<$Res,
        _$_ChangePasswordBlocState>
    implements _$$_ChangePasswordBlocStateCopyWith<$Res> {
  __$$_ChangePasswordBlocStateCopyWithImpl(_$_ChangePasswordBlocState _value,
      $Res Function(_$_ChangePasswordBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_ChangePasswordBlocState(
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChangePasswordStatus,
    ));
  }
}

/// @nodoc

class _$_ChangePasswordBlocState implements _ChangePasswordBlocState {
  const _$_ChangePasswordBlocState(
      {required this.output, required this.errorObject, required this.status});

  @override
  final DefaultOutput? output;
  @override
  final ErrorObject? errorObject;
  @override
  final ChangePasswordStatus status;

  @override
  String toString() {
    return 'ChangePasswordBlocState(output: $output, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordBlocState &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, output, errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordBlocStateCopyWith<_$_ChangePasswordBlocState>
      get copyWith =>
          __$$_ChangePasswordBlocStateCopyWithImpl<_$_ChangePasswordBlocState>(
              this, _$identity);
}

abstract class _ChangePasswordBlocState implements ChangePasswordBlocState {
  const factory _ChangePasswordBlocState(
      {required final DefaultOutput? output,
      required final ErrorObject? errorObject,
      required final ChangePasswordStatus status}) = _$_ChangePasswordBlocState;

  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  ChangePasswordStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordBlocStateCopyWith<_$_ChangePasswordBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
