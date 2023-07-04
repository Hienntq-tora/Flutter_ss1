// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_feedback_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorFeedbackBlocState {
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  TutorFeedbackStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorFeedbackBlocStateCopyWith<TutorFeedbackBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorFeedbackBlocStateCopyWith<$Res> {
  factory $TutorFeedbackBlocStateCopyWith(TutorFeedbackBlocState value,
          $Res Function(TutorFeedbackBlocState) then) =
      _$TutorFeedbackBlocStateCopyWithImpl<$Res, TutorFeedbackBlocState>;
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      TutorFeedbackStatus status});
}

/// @nodoc
class _$TutorFeedbackBlocStateCopyWithImpl<$Res,
        $Val extends TutorFeedbackBlocState>
    implements $TutorFeedbackBlocStateCopyWith<$Res> {
  _$TutorFeedbackBlocStateCopyWithImpl(this._value, this._then);

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
              as TutorFeedbackStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorFeedbackBlocStateCopyWith<$Res>
    implements $TutorFeedbackBlocStateCopyWith<$Res> {
  factory _$$_TutorFeedbackBlocStateCopyWith(_$_TutorFeedbackBlocState value,
          $Res Function(_$_TutorFeedbackBlocState) then) =
      __$$_TutorFeedbackBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      TutorFeedbackStatus status});
}

/// @nodoc
class __$$_TutorFeedbackBlocStateCopyWithImpl<$Res>
    extends _$TutorFeedbackBlocStateCopyWithImpl<$Res,
        _$_TutorFeedbackBlocState>
    implements _$$_TutorFeedbackBlocStateCopyWith<$Res> {
  __$$_TutorFeedbackBlocStateCopyWithImpl(_$_TutorFeedbackBlocState _value,
      $Res Function(_$_TutorFeedbackBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_TutorFeedbackBlocState(
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
              as TutorFeedbackStatus,
    ));
  }
}

/// @nodoc

class _$_TutorFeedbackBlocState implements _TutorFeedbackBlocState {
  const _$_TutorFeedbackBlocState(
      {required this.output, required this.errorObject, required this.status});

  @override
  final DefaultOutput? output;
  @override
  final ErrorObject? errorObject;
  @override
  final TutorFeedbackStatus status;

  @override
  String toString() {
    return 'TutorFeedbackBlocState(output: $output, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorFeedbackBlocState &&
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
  _$$_TutorFeedbackBlocStateCopyWith<_$_TutorFeedbackBlocState> get copyWith =>
      __$$_TutorFeedbackBlocStateCopyWithImpl<_$_TutorFeedbackBlocState>(
          this, _$identity);
}

abstract class _TutorFeedbackBlocState implements TutorFeedbackBlocState {
  const factory _TutorFeedbackBlocState(
      {required final DefaultOutput? output,
      required final ErrorObject? errorObject,
      required final TutorFeedbackStatus status}) = _$_TutorFeedbackBlocState;

  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  TutorFeedbackStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_TutorFeedbackBlocStateCopyWith<_$_TutorFeedbackBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
