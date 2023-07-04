// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_home_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorHomeBlocState {
  TutorHomeStatus get status => throw _privateConstructorUsedError;
  List<TutorAppointment>? get appointments =>
      throw _privateConstructorUsedError;
  List<ReservableDate>? get reservableDates =>
      throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorHomeBlocStateCopyWith<TutorHomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorHomeBlocStateCopyWith<$Res> {
  factory $TutorHomeBlocStateCopyWith(
          TutorHomeBlocState value, $Res Function(TutorHomeBlocState) then) =
      _$TutorHomeBlocStateCopyWithImpl<$Res, TutorHomeBlocState>;
  @useResult
  $Res call(
      {TutorHomeStatus status,
      List<TutorAppointment>? appointments,
      List<ReservableDate>? reservableDates,
      ErrorObject? errorObject});
}

/// @nodoc
class _$TutorHomeBlocStateCopyWithImpl<$Res, $Val extends TutorHomeBlocState>
    implements $TutorHomeBlocStateCopyWith<$Res> {
  _$TutorHomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? appointments = freezed,
    Object? reservableDates = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TutorHomeStatus,
      appointments: freezed == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<TutorAppointment>?,
      reservableDates: freezed == reservableDates
          ? _value.reservableDates
          : reservableDates // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorHomeBlocStateCopyWith<$Res>
    implements $TutorHomeBlocStateCopyWith<$Res> {
  factory _$$_TutorHomeBlocStateCopyWith(_$_TutorHomeBlocState value,
          $Res Function(_$_TutorHomeBlocState) then) =
      __$$_TutorHomeBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TutorHomeStatus status,
      List<TutorAppointment>? appointments,
      List<ReservableDate>? reservableDates,
      ErrorObject? errorObject});
}

/// @nodoc
class __$$_TutorHomeBlocStateCopyWithImpl<$Res>
    extends _$TutorHomeBlocStateCopyWithImpl<$Res, _$_TutorHomeBlocState>
    implements _$$_TutorHomeBlocStateCopyWith<$Res> {
  __$$_TutorHomeBlocStateCopyWithImpl(
      _$_TutorHomeBlocState _value, $Res Function(_$_TutorHomeBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? appointments = freezed,
    Object? reservableDates = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_$_TutorHomeBlocState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TutorHomeStatus,
      appointments: freezed == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<TutorAppointment>?,
      reservableDates: freezed == reservableDates
          ? _value._reservableDates
          : reservableDates // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ));
  }
}

/// @nodoc

class _$_TutorHomeBlocState implements _TutorHomeBlocState {
  const _$_TutorHomeBlocState(
      {required this.status,
      required final List<TutorAppointment>? appointments,
      required final List<ReservableDate>? reservableDates,
      required this.errorObject})
      : _appointments = appointments,
        _reservableDates = reservableDates;

  @override
  final TutorHomeStatus status;
  final List<TutorAppointment>? _appointments;
  @override
  List<TutorAppointment>? get appointments {
    final value = _appointments;
    if (value == null) return null;
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  String toString() {
    return 'TutorHomeBlocState(status: $status, appointments: $appointments, reservableDates: $reservableDates, errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorHomeBlocState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            const DeepCollectionEquality()
                .equals(other._reservableDates, _reservableDates) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_appointments),
      const DeepCollectionEquality().hash(_reservableDates),
      errorObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorHomeBlocStateCopyWith<_$_TutorHomeBlocState> get copyWith =>
      __$$_TutorHomeBlocStateCopyWithImpl<_$_TutorHomeBlocState>(
          this, _$identity);
}

abstract class _TutorHomeBlocState implements TutorHomeBlocState {
  const factory _TutorHomeBlocState(
      {required final TutorHomeStatus status,
      required final List<TutorAppointment>? appointments,
      required final List<ReservableDate>? reservableDates,
      required final ErrorObject? errorObject}) = _$_TutorHomeBlocState;

  @override
  TutorHomeStatus get status;
  @override
  List<TutorAppointment>? get appointments;
  @override
  List<ReservableDate>? get reservableDates;
  @override
  ErrorObject? get errorObject;
  @override
  @JsonKey(ignore: true)
  _$$_TutorHomeBlocStateCopyWith<_$_TutorHomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
