// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_lessons_by_tutor_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetLessonsByTutorBlocState {
  List<Lesson>? get lessonList => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  GetLessonsByTutorStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetLessonsByTutorBlocStateCopyWith<GetLessonsByTutorBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLessonsByTutorBlocStateCopyWith<$Res> {
  factory $GetLessonsByTutorBlocStateCopyWith(GetLessonsByTutorBlocState value,
          $Res Function(GetLessonsByTutorBlocState) then) =
      _$GetLessonsByTutorBlocStateCopyWithImpl<$Res,
          GetLessonsByTutorBlocState>;
  @useResult
  $Res call(
      {List<Lesson>? lessonList,
      ErrorObject? errorObject,
      GetLessonsByTutorStatus status});
}

/// @nodoc
class _$GetLessonsByTutorBlocStateCopyWithImpl<$Res,
        $Val extends GetLessonsByTutorBlocState>
    implements $GetLessonsByTutorBlocStateCopyWith<$Res> {
  _$GetLessonsByTutorBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonList = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      lessonList: freezed == lessonList
          ? _value.lessonList
          : lessonList // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetLessonsByTutorStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetLessonsByTutorBlocStateCopyWith<$Res>
    implements $GetLessonsByTutorBlocStateCopyWith<$Res> {
  factory _$$_GetLessonsByTutorBlocStateCopyWith(
          _$_GetLessonsByTutorBlocState value,
          $Res Function(_$_GetLessonsByTutorBlocState) then) =
      __$$_GetLessonsByTutorBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lesson>? lessonList,
      ErrorObject? errorObject,
      GetLessonsByTutorStatus status});
}

/// @nodoc
class __$$_GetLessonsByTutorBlocStateCopyWithImpl<$Res>
    extends _$GetLessonsByTutorBlocStateCopyWithImpl<$Res,
        _$_GetLessonsByTutorBlocState>
    implements _$$_GetLessonsByTutorBlocStateCopyWith<$Res> {
  __$$_GetLessonsByTutorBlocStateCopyWithImpl(
      _$_GetLessonsByTutorBlocState _value,
      $Res Function(_$_GetLessonsByTutorBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonList = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_GetLessonsByTutorBlocState(
      lessonList: freezed == lessonList
          ? _value._lessonList
          : lessonList // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GetLessonsByTutorStatus,
    ));
  }
}

/// @nodoc

class _$_GetLessonsByTutorBlocState implements _GetLessonsByTutorBlocState {
  const _$_GetLessonsByTutorBlocState(
      {required final List<Lesson>? lessonList,
      required this.errorObject,
      required this.status})
      : _lessonList = lessonList;

  final List<Lesson>? _lessonList;
  @override
  List<Lesson>? get lessonList {
    final value = _lessonList;
    if (value == null) return null;
    if (_lessonList is EqualUnmodifiableListView) return _lessonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final GetLessonsByTutorStatus status;

  @override
  String toString() {
    return 'GetLessonsByTutorBlocState(lessonList: $lessonList, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetLessonsByTutorBlocState &&
            const DeepCollectionEquality()
                .equals(other._lessonList, _lessonList) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_lessonList), errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetLessonsByTutorBlocStateCopyWith<_$_GetLessonsByTutorBlocState>
      get copyWith => __$$_GetLessonsByTutorBlocStateCopyWithImpl<
          _$_GetLessonsByTutorBlocState>(this, _$identity);
}

abstract class _GetLessonsByTutorBlocState
    implements GetLessonsByTutorBlocState {
  const factory _GetLessonsByTutorBlocState(
          {required final List<Lesson>? lessonList,
          required final ErrorObject? errorObject,
          required final GetLessonsByTutorStatus status}) =
      _$_GetLessonsByTutorBlocState;

  @override
  List<Lesson>? get lessonList;
  @override
  ErrorObject? get errorObject;
  @override
  GetLessonsByTutorStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_GetLessonsByTutorBlocStateCopyWith<_$_GetLessonsByTutorBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
