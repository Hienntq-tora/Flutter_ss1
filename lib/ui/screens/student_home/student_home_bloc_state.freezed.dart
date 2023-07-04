// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_home_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StudentHomeBlocState {
  List<Lesson> get popularLessons => throw _privateConstructorUsedError;
  List<Lesson> get newLessons => throw _privateConstructorUsedError;
  List<Lesson> get topRatedLessons => throw _privateConstructorUsedError;
  List<Field> get fields => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  StudentHomeStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentHomeBlocStateCopyWith<StudentHomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentHomeBlocStateCopyWith<$Res> {
  factory $StudentHomeBlocStateCopyWith(StudentHomeBlocState value,
          $Res Function(StudentHomeBlocState) then) =
      _$StudentHomeBlocStateCopyWithImpl<$Res, StudentHomeBlocState>;
  @useResult
  $Res call(
      {List<Lesson> popularLessons,
      List<Lesson> newLessons,
      List<Lesson> topRatedLessons,
      List<Field> fields,
      ErrorObject? errorObject,
      StudentHomeStatus status});
}

/// @nodoc
class _$StudentHomeBlocStateCopyWithImpl<$Res,
        $Val extends StudentHomeBlocState>
    implements $StudentHomeBlocStateCopyWith<$Res> {
  _$StudentHomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popularLessons = null,
    Object? newLessons = null,
    Object? topRatedLessons = null,
    Object? fields = null,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      popularLessons: null == popularLessons
          ? _value.popularLessons
          : popularLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      newLessons: null == newLessons
          ? _value.newLessons
          : newLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      topRatedLessons: null == topRatedLessons
          ? _value.topRatedLessons
          : topRatedLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StudentHomeStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentHomeBlocStateCopyWith<$Res>
    implements $StudentHomeBlocStateCopyWith<$Res> {
  factory _$$_StudentHomeBlocStateCopyWith(_$_StudentHomeBlocState value,
          $Res Function(_$_StudentHomeBlocState) then) =
      __$$_StudentHomeBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lesson> popularLessons,
      List<Lesson> newLessons,
      List<Lesson> topRatedLessons,
      List<Field> fields,
      ErrorObject? errorObject,
      StudentHomeStatus status});
}

/// @nodoc
class __$$_StudentHomeBlocStateCopyWithImpl<$Res>
    extends _$StudentHomeBlocStateCopyWithImpl<$Res, _$_StudentHomeBlocState>
    implements _$$_StudentHomeBlocStateCopyWith<$Res> {
  __$$_StudentHomeBlocStateCopyWithImpl(_$_StudentHomeBlocState _value,
      $Res Function(_$_StudentHomeBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popularLessons = null,
    Object? newLessons = null,
    Object? topRatedLessons = null,
    Object? fields = null,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_StudentHomeBlocState(
      popularLessons: null == popularLessons
          ? _value._popularLessons
          : popularLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      newLessons: null == newLessons
          ? _value._newLessons
          : newLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      topRatedLessons: null == topRatedLessons
          ? _value._topRatedLessons
          : topRatedLessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StudentHomeStatus,
    ));
  }
}

/// @nodoc

class _$_StudentHomeBlocState implements _StudentHomeBlocState {
  const _$_StudentHomeBlocState(
      {required final List<Lesson> popularLessons,
      required final List<Lesson> newLessons,
      required final List<Lesson> topRatedLessons,
      required final List<Field> fields,
      required this.errorObject,
      required this.status})
      : _popularLessons = popularLessons,
        _newLessons = newLessons,
        _topRatedLessons = topRatedLessons,
        _fields = fields;

  final List<Lesson> _popularLessons;
  @override
  List<Lesson> get popularLessons {
    if (_popularLessons is EqualUnmodifiableListView) return _popularLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularLessons);
  }

  final List<Lesson> _newLessons;
  @override
  List<Lesson> get newLessons {
    if (_newLessons is EqualUnmodifiableListView) return _newLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newLessons);
  }

  final List<Lesson> _topRatedLessons;
  @override
  List<Lesson> get topRatedLessons {
    if (_topRatedLessons is EqualUnmodifiableListView) return _topRatedLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topRatedLessons);
  }

  final List<Field> _fields;
  @override
  List<Field> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final StudentHomeStatus status;

  @override
  String toString() {
    return 'StudentHomeBlocState(popularLessons: $popularLessons, newLessons: $newLessons, topRatedLessons: $topRatedLessons, fields: $fields, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StudentHomeBlocState &&
            const DeepCollectionEquality()
                .equals(other._popularLessons, _popularLessons) &&
            const DeepCollectionEquality()
                .equals(other._newLessons, _newLessons) &&
            const DeepCollectionEquality()
                .equals(other._topRatedLessons, _topRatedLessons) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_popularLessons),
      const DeepCollectionEquality().hash(_newLessons),
      const DeepCollectionEquality().hash(_topRatedLessons),
      const DeepCollectionEquality().hash(_fields),
      errorObject,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentHomeBlocStateCopyWith<_$_StudentHomeBlocState> get copyWith =>
      __$$_StudentHomeBlocStateCopyWithImpl<_$_StudentHomeBlocState>(
          this, _$identity);
}

abstract class _StudentHomeBlocState implements StudentHomeBlocState {
  const factory _StudentHomeBlocState(
      {required final List<Lesson> popularLessons,
      required final List<Lesson> newLessons,
      required final List<Lesson> topRatedLessons,
      required final List<Field> fields,
      required final ErrorObject? errorObject,
      required final StudentHomeStatus status}) = _$_StudentHomeBlocState;

  @override
  List<Lesson> get popularLessons;
  @override
  List<Lesson> get newLessons;
  @override
  List<Lesson> get topRatedLessons;
  @override
  List<Field> get fields;
  @override
  ErrorObject? get errorObject;
  @override
  StudentHomeStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_StudentHomeBlocStateCopyWith<_$_StudentHomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
