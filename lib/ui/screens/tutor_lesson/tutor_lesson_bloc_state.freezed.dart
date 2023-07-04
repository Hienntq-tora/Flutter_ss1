// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_lesson_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorLessonBlocState {
  List<Lesson>? get data => throw _privateConstructorUsedError;
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  TutorLessonStatus get tutorLessonStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorLessonBlocStateCopyWith<TutorLessonBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorLessonBlocStateCopyWith<$Res> {
  factory $TutorLessonBlocStateCopyWith(TutorLessonBlocState value,
          $Res Function(TutorLessonBlocState) then) =
      _$TutorLessonBlocStateCopyWithImpl<$Res, TutorLessonBlocState>;
  @useResult
  $Res call(
      {List<Lesson>? data,
      DefaultOutput? output,
      ErrorObject? errorObject,
      TutorLessonStatus tutorLessonStatus});
}

/// @nodoc
class _$TutorLessonBlocStateCopyWithImpl<$Res,
        $Val extends TutorLessonBlocState>
    implements $TutorLessonBlocStateCopyWith<$Res> {
  _$TutorLessonBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? tutorLessonStatus = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      tutorLessonStatus: null == tutorLessonStatus
          ? _value.tutorLessonStatus
          : tutorLessonStatus // ignore: cast_nullable_to_non_nullable
              as TutorLessonStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorLessonBlocStateCopyWith<$Res>
    implements $TutorLessonBlocStateCopyWith<$Res> {
  factory _$$_TutorLessonBlocStateCopyWith(_$_TutorLessonBlocState value,
          $Res Function(_$_TutorLessonBlocState) then) =
      __$$_TutorLessonBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lesson>? data,
      DefaultOutput? output,
      ErrorObject? errorObject,
      TutorLessonStatus tutorLessonStatus});
}

/// @nodoc
class __$$_TutorLessonBlocStateCopyWithImpl<$Res>
    extends _$TutorLessonBlocStateCopyWithImpl<$Res, _$_TutorLessonBlocState>
    implements _$$_TutorLessonBlocStateCopyWith<$Res> {
  __$$_TutorLessonBlocStateCopyWithImpl(_$_TutorLessonBlocState _value,
      $Res Function(_$_TutorLessonBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? tutorLessonStatus = null,
  }) {
    return _then(_$_TutorLessonBlocState(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      tutorLessonStatus: null == tutorLessonStatus
          ? _value.tutorLessonStatus
          : tutorLessonStatus // ignore: cast_nullable_to_non_nullable
              as TutorLessonStatus,
    ));
  }
}

/// @nodoc

class _$_TutorLessonBlocState implements _TutorLessonBlocState {
  const _$_TutorLessonBlocState(
      {required final List<Lesson>? data,
      required this.output,
      required this.errorObject,
      required this.tutorLessonStatus})
      : _data = data;

  final List<Lesson>? _data;
  @override
  List<Lesson>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DefaultOutput? output;
  @override
  final ErrorObject? errorObject;
  @override
  final TutorLessonStatus tutorLessonStatus;

  @override
  String toString() {
    return 'TutorLessonBlocState(data: $data, output: $output, errorObject: $errorObject, tutorLessonStatus: $tutorLessonStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorLessonBlocState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.tutorLessonStatus, tutorLessonStatus) ||
                other.tutorLessonStatus == tutorLessonStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      output,
      errorObject,
      tutorLessonStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorLessonBlocStateCopyWith<_$_TutorLessonBlocState> get copyWith =>
      __$$_TutorLessonBlocStateCopyWithImpl<_$_TutorLessonBlocState>(
          this, _$identity);
}

abstract class _TutorLessonBlocState implements TutorLessonBlocState {
  const factory _TutorLessonBlocState(
          {required final List<Lesson>? data,
          required final DefaultOutput? output,
          required final ErrorObject? errorObject,
          required final TutorLessonStatus tutorLessonStatus}) =
      _$_TutorLessonBlocState;

  @override
  List<Lesson>? get data;
  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  TutorLessonStatus get tutorLessonStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TutorLessonBlocStateCopyWith<_$_TutorLessonBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
