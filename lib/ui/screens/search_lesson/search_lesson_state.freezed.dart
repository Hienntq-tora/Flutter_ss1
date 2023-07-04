// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchLessonBlocState {
  List<Lesson>? get data => throw _privateConstructorUsedError;
  List<Field>? get fields => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  SearchLessonStatus get searchLessonStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchLessonBlocStateCopyWith<SearchLessonBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLessonBlocStateCopyWith<$Res> {
  factory $SearchLessonBlocStateCopyWith(SearchLessonBlocState value,
          $Res Function(SearchLessonBlocState) then) =
      _$SearchLessonBlocStateCopyWithImpl<$Res, SearchLessonBlocState>;
  @useResult
  $Res call(
      {List<Lesson>? data,
      List<Field>? fields,
      ErrorObject? errorObject,
      SearchLessonStatus searchLessonStatus});
}

/// @nodoc
class _$SearchLessonBlocStateCopyWithImpl<$Res,
        $Val extends SearchLessonBlocState>
    implements $SearchLessonBlocStateCopyWith<$Res> {
  _$SearchLessonBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? fields = freezed,
    Object? errorObject = freezed,
    Object? searchLessonStatus = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      searchLessonStatus: null == searchLessonStatus
          ? _value.searchLessonStatus
          : searchLessonStatus // ignore: cast_nullable_to_non_nullable
              as SearchLessonStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterTimeTrackerBlocStateCopyWith<$Res>
    implements $SearchLessonBlocStateCopyWith<$Res> {
  factory _$$_FilterTimeTrackerBlocStateCopyWith(
          _$_FilterTimeTrackerBlocState value,
          $Res Function(_$_FilterTimeTrackerBlocState) then) =
      __$$_FilterTimeTrackerBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Lesson>? data,
      List<Field>? fields,
      ErrorObject? errorObject,
      SearchLessonStatus searchLessonStatus});
}

/// @nodoc
class __$$_FilterTimeTrackerBlocStateCopyWithImpl<$Res>
    extends _$SearchLessonBlocStateCopyWithImpl<$Res,
        _$_FilterTimeTrackerBlocState>
    implements _$$_FilterTimeTrackerBlocStateCopyWith<$Res> {
  __$$_FilterTimeTrackerBlocStateCopyWithImpl(
      _$_FilterTimeTrackerBlocState _value,
      $Res Function(_$_FilterTimeTrackerBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? fields = freezed,
    Object? errorObject = freezed,
    Object? searchLessonStatus = null,
  }) {
    return _then(_$_FilterTimeTrackerBlocState(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      fields: freezed == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      searchLessonStatus: null == searchLessonStatus
          ? _value.searchLessonStatus
          : searchLessonStatus // ignore: cast_nullable_to_non_nullable
              as SearchLessonStatus,
    ));
  }
}

/// @nodoc

class _$_FilterTimeTrackerBlocState implements _FilterTimeTrackerBlocState {
  const _$_FilterTimeTrackerBlocState(
      {required final List<Lesson>? data,
      required final List<Field>? fields,
      required this.errorObject,
      required this.searchLessonStatus})
      : _data = data,
        _fields = fields;

  final List<Lesson>? _data;
  @override
  List<Lesson>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Field>? _fields;
  @override
  List<Field>? get fields {
    final value = _fields;
    if (value == null) return null;
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final SearchLessonStatus searchLessonStatus;

  @override
  String toString() {
    return 'SearchLessonBlocState(data: $data, fields: $fields, errorObject: $errorObject, searchLessonStatus: $searchLessonStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterTimeTrackerBlocState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.searchLessonStatus, searchLessonStatus) ||
                other.searchLessonStatus == searchLessonStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_fields),
      errorObject,
      searchLessonStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterTimeTrackerBlocStateCopyWith<_$_FilterTimeTrackerBlocState>
      get copyWith => __$$_FilterTimeTrackerBlocStateCopyWithImpl<
          _$_FilterTimeTrackerBlocState>(this, _$identity);
}

abstract class _FilterTimeTrackerBlocState implements SearchLessonBlocState {
  const factory _FilterTimeTrackerBlocState(
          {required final List<Lesson>? data,
          required final List<Field>? fields,
          required final ErrorObject? errorObject,
          required final SearchLessonStatus searchLessonStatus}) =
      _$_FilterTimeTrackerBlocState;

  @override
  List<Lesson>? get data;
  @override
  List<Field>? get fields;
  @override
  ErrorObject? get errorObject;
  @override
  SearchLessonStatus get searchLessonStatus;
  @override
  @JsonKey(ignore: true)
  _$$_FilterTimeTrackerBlocStateCopyWith<_$_FilterTimeTrackerBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
