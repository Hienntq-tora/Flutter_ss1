// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_schedule_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateScheduleBlocState {
  List<ReservableDate>? get reservableDates =>
      throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  UpdateScheduleStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateScheduleBlocStateCopyWith<UpdateScheduleBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateScheduleBlocStateCopyWith<$Res> {
  factory $UpdateScheduleBlocStateCopyWith(UpdateScheduleBlocState value,
          $Res Function(UpdateScheduleBlocState) then) =
      _$UpdateScheduleBlocStateCopyWithImpl<$Res, UpdateScheduleBlocState>;
  @useResult
  $Res call(
      {List<ReservableDate>? reservableDates,
      ErrorObject? errorObject,
      UpdateScheduleStatus status});
}

/// @nodoc
class _$UpdateScheduleBlocStateCopyWithImpl<$Res,
        $Val extends UpdateScheduleBlocState>
    implements $UpdateScheduleBlocStateCopyWith<$Res> {
  _$UpdateScheduleBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservableDates = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      reservableDates: freezed == reservableDates
          ? _value.reservableDates
          : reservableDates // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateScheduleStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateScheduleBlocStateCopyWith<$Res>
    implements $UpdateScheduleBlocStateCopyWith<$Res> {
  factory _$$_UpdateScheduleBlocStateCopyWith(_$_UpdateScheduleBlocState value,
          $Res Function(_$_UpdateScheduleBlocState) then) =
      __$$_UpdateScheduleBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReservableDate>? reservableDates,
      ErrorObject? errorObject,
      UpdateScheduleStatus status});
}

/// @nodoc
class __$$_UpdateScheduleBlocStateCopyWithImpl<$Res>
    extends _$UpdateScheduleBlocStateCopyWithImpl<$Res,
        _$_UpdateScheduleBlocState>
    implements _$$_UpdateScheduleBlocStateCopyWith<$Res> {
  __$$_UpdateScheduleBlocStateCopyWithImpl(_$_UpdateScheduleBlocState _value,
      $Res Function(_$_UpdateScheduleBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservableDates = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_UpdateScheduleBlocState(
      reservableDates: freezed == reservableDates
          ? _value._reservableDates
          : reservableDates // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateScheduleStatus,
    ));
  }
}

/// @nodoc

class _$_UpdateScheduleBlocState implements _UpdateScheduleBlocState {
  const _$_UpdateScheduleBlocState(
      {required final List<ReservableDate>? reservableDates,
      required this.errorObject,
      required this.status})
      : _reservableDates = reservableDates;

  final List<ReservableDate>? _reservableDates;
  @override
  List<ReservableDate>? get reservableDates {
    final value = _reservableDates;
    if (value == null) return null;
    if (_reservableDates is EqualUnmodifiableListView) return _reservableDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ErrorObject? errorObject;
  @override
  final UpdateScheduleStatus status;

  @override
  String toString() {
    return 'UpdateScheduleBlocState(reservableDates: $reservableDates, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateScheduleBlocState &&
            const DeepCollectionEquality()
                .equals(other._reservableDates, _reservableDates) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservableDates),
      errorObject,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateScheduleBlocStateCopyWith<_$_UpdateScheduleBlocState>
      get copyWith =>
          __$$_UpdateScheduleBlocStateCopyWithImpl<_$_UpdateScheduleBlocState>(
              this, _$identity);
}

abstract class _UpdateScheduleBlocState implements UpdateScheduleBlocState {
  const factory _UpdateScheduleBlocState(
      {required final List<ReservableDate>? reservableDates,
      required final ErrorObject? errorObject,
      required final UpdateScheduleStatus status}) = _$_UpdateScheduleBlocState;

  @override
  List<ReservableDate>? get reservableDates;
  @override
  ErrorObject? get errorObject;
  @override
  UpdateScheduleStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateScheduleBlocStateCopyWith<_$_UpdateScheduleBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
