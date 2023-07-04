// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tutor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchTutorBlocState {
  List<Tutor>? get data => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  SearchTutorStatus get searchTutorStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchTutorBlocStateCopyWith<SearchTutorBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTutorBlocStateCopyWith<$Res> {
  factory $SearchTutorBlocStateCopyWith(SearchTutorBlocState value,
          $Res Function(SearchTutorBlocState) then) =
      _$SearchTutorBlocStateCopyWithImpl<$Res, SearchTutorBlocState>;
  @useResult
  $Res call(
      {List<Tutor>? data,
      ErrorObject? errorObject,
      SearchTutorStatus searchTutorStatus});
}

/// @nodoc
class _$SearchTutorBlocStateCopyWithImpl<$Res,
        $Val extends SearchTutorBlocState>
    implements $SearchTutorBlocStateCopyWith<$Res> {
  _$SearchTutorBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? errorObject = freezed,
    Object? searchTutorStatus = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Tutor>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      searchTutorStatus: null == searchTutorStatus
          ? _value.searchTutorStatus
          : searchTutorStatus // ignore: cast_nullable_to_non_nullable
              as SearchTutorStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterTimeTrackerBlocStateCopyWith<$Res>
    implements $SearchTutorBlocStateCopyWith<$Res> {
  factory _$$_FilterTimeTrackerBlocStateCopyWith(
          _$_FilterTimeTrackerBlocState value,
          $Res Function(_$_FilterTimeTrackerBlocState) then) =
      __$$_FilterTimeTrackerBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Tutor>? data,
      ErrorObject? errorObject,
      SearchTutorStatus searchTutorStatus});
}

/// @nodoc
class __$$_FilterTimeTrackerBlocStateCopyWithImpl<$Res>
    extends _$SearchTutorBlocStateCopyWithImpl<$Res,
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
    Object? errorObject = freezed,
    Object? searchTutorStatus = null,
  }) {
    return _then(_$_FilterTimeTrackerBlocState(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Tutor>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      searchTutorStatus: null == searchTutorStatus
          ? _value.searchTutorStatus
          : searchTutorStatus // ignore: cast_nullable_to_non_nullable
              as SearchTutorStatus,
    ));
  }
}

/// @nodoc

class _$_FilterTimeTrackerBlocState implements _FilterTimeTrackerBlocState {
  const _$_FilterTimeTrackerBlocState(
      {required final List<Tutor>? data,
      required this.errorObject,
      required this.searchTutorStatus})
      : _data = data;

  final List<Tutor>? _data;
  @override
  List<Tutor>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final SearchTutorStatus searchTutorStatus;

  @override
  String toString() {
    return 'SearchTutorBlocState(data: $data, errorObject: $errorObject, searchTutorStatus: $searchTutorStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilterTimeTrackerBlocState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.searchTutorStatus, searchTutorStatus) ||
                other.searchTutorStatus == searchTutorStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      errorObject,
      searchTutorStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterTimeTrackerBlocStateCopyWith<_$_FilterTimeTrackerBlocState>
      get copyWith => __$$_FilterTimeTrackerBlocStateCopyWithImpl<
          _$_FilterTimeTrackerBlocState>(this, _$identity);
}

abstract class _FilterTimeTrackerBlocState implements SearchTutorBlocState {
  const factory _FilterTimeTrackerBlocState(
          {required final List<Tutor>? data,
          required final ErrorObject? errorObject,
          required final SearchTutorStatus searchTutorStatus}) =
      _$_FilterTimeTrackerBlocState;

  @override
  List<Tutor>? get data;
  @override
  ErrorObject? get errorObject;
  @override
  SearchTutorStatus get searchTutorStatus;
  @override
  @JsonKey(ignore: true)
  _$$_FilterTimeTrackerBlocStateCopyWith<_$_FilterTimeTrackerBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
