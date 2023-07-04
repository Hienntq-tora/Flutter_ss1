// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_history_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LessonHistoryBlocState {
  List<LessonHistoryOutput> get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  LessonHistoryStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LessonHistoryBlocStateCopyWith<LessonHistoryBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonHistoryBlocStateCopyWith<$Res> {
  factory $LessonHistoryBlocStateCopyWith(LessonHistoryBlocState value,
          $Res Function(LessonHistoryBlocState) then) =
      _$LessonHistoryBlocStateCopyWithImpl<$Res, LessonHistoryBlocState>;
  @useResult
  $Res call(
      {List<LessonHistoryOutput> output,
      ErrorObject? errorObject,
      LessonHistoryStatus status});
}

/// @nodoc
class _$LessonHistoryBlocStateCopyWithImpl<$Res,
        $Val extends LessonHistoryBlocState>
    implements $LessonHistoryBlocStateCopyWith<$Res> {
  _$LessonHistoryBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      output: null == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<LessonHistoryOutput>,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonHistoryStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonHistoryBlocStateCopyWith<$Res>
    implements $LessonHistoryBlocStateCopyWith<$Res> {
  factory _$$_LessonHistoryBlocStateCopyWith(_$_LessonHistoryBlocState value,
          $Res Function(_$_LessonHistoryBlocState) then) =
      __$$_LessonHistoryBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LessonHistoryOutput> output,
      ErrorObject? errorObject,
      LessonHistoryStatus status});
}

/// @nodoc
class __$$_LessonHistoryBlocStateCopyWithImpl<$Res>
    extends _$LessonHistoryBlocStateCopyWithImpl<$Res,
        _$_LessonHistoryBlocState>
    implements _$$_LessonHistoryBlocStateCopyWith<$Res> {
  __$$_LessonHistoryBlocStateCopyWithImpl(_$_LessonHistoryBlocState _value,
      $Res Function(_$_LessonHistoryBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = null,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_LessonHistoryBlocState(
      output: null == output
          ? _value._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<LessonHistoryOutput>,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LessonHistoryStatus,
    ));
  }
}

/// @nodoc

class _$_LessonHistoryBlocState implements _LessonHistoryBlocState {
  const _$_LessonHistoryBlocState(
      {required final List<LessonHistoryOutput> output,
      required this.errorObject,
      required this.status})
      : _output = output;

  final List<LessonHistoryOutput> _output;
  @override
  List<LessonHistoryOutput> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final LessonHistoryStatus status;

  @override
  String toString() {
    return 'LessonHistoryBlocState(output: $output, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonHistoryBlocState &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_output), errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonHistoryBlocStateCopyWith<_$_LessonHistoryBlocState> get copyWith =>
      __$$_LessonHistoryBlocStateCopyWithImpl<_$_LessonHistoryBlocState>(
          this, _$identity);
}

abstract class _LessonHistoryBlocState implements LessonHistoryBlocState {
  const factory _LessonHistoryBlocState(
      {required final List<LessonHistoryOutput> output,
      required final ErrorObject? errorObject,
      required final LessonHistoryStatus status}) = _$_LessonHistoryBlocState;

  @override
  List<LessonHistoryOutput> get output;
  @override
  ErrorObject? get errorObject;
  @override
  LessonHistoryStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_LessonHistoryBlocStateCopyWith<_$_LessonHistoryBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
