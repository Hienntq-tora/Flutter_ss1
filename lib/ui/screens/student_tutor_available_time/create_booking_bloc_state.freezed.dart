// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateBookingBlocState {
  List<ReservableDate>? get reservableDateList =>
      throw _privateConstructorUsedError;
  CreateBookingOutput? get createBookingOutput =>
      throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  CreateBookingStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateBookingBlocStateCopyWith<CreateBookingBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingBlocStateCopyWith<$Res> {
  factory $CreateBookingBlocStateCopyWith(CreateBookingBlocState value,
          $Res Function(CreateBookingBlocState) then) =
      _$CreateBookingBlocStateCopyWithImpl<$Res, CreateBookingBlocState>;
  @useResult
  $Res call(
      {List<ReservableDate>? reservableDateList,
      CreateBookingOutput? createBookingOutput,
      ErrorObject? errorObject,
      CreateBookingStatus status});
}

/// @nodoc
class _$CreateBookingBlocStateCopyWithImpl<$Res,
        $Val extends CreateBookingBlocState>
    implements $CreateBookingBlocStateCopyWith<$Res> {
  _$CreateBookingBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservableDateList = freezed,
    Object? createBookingOutput = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      reservableDateList: freezed == reservableDateList
          ? _value.reservableDateList
          : reservableDateList // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      createBookingOutput: freezed == createBookingOutput
          ? _value.createBookingOutput
          : createBookingOutput // ignore: cast_nullable_to_non_nullable
              as CreateBookingOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateBookingStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateBookingBlocStateCopyWith<$Res>
    implements $CreateBookingBlocStateCopyWith<$Res> {
  factory _$$_CreateBookingBlocStateCopyWith(_$_CreateBookingBlocState value,
          $Res Function(_$_CreateBookingBlocState) then) =
      __$$_CreateBookingBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReservableDate>? reservableDateList,
      CreateBookingOutput? createBookingOutput,
      ErrorObject? errorObject,
      CreateBookingStatus status});
}

/// @nodoc
class __$$_CreateBookingBlocStateCopyWithImpl<$Res>
    extends _$CreateBookingBlocStateCopyWithImpl<$Res,
        _$_CreateBookingBlocState>
    implements _$$_CreateBookingBlocStateCopyWith<$Res> {
  __$$_CreateBookingBlocStateCopyWithImpl(_$_CreateBookingBlocState _value,
      $Res Function(_$_CreateBookingBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservableDateList = freezed,
    Object? createBookingOutput = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_CreateBookingBlocState(
      reservableDateList: freezed == reservableDateList
          ? _value._reservableDateList
          : reservableDateList // ignore: cast_nullable_to_non_nullable
              as List<ReservableDate>?,
      createBookingOutput: freezed == createBookingOutput
          ? _value.createBookingOutput
          : createBookingOutput // ignore: cast_nullable_to_non_nullable
              as CreateBookingOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateBookingStatus,
    ));
  }
}

/// @nodoc

class _$_CreateBookingBlocState implements _CreateBookingBlocState {
  const _$_CreateBookingBlocState(
      {required final List<ReservableDate>? reservableDateList,
      required this.createBookingOutput,
      required this.errorObject,
      required this.status})
      : _reservableDateList = reservableDateList;

  final List<ReservableDate>? _reservableDateList;
  @override
  List<ReservableDate>? get reservableDateList {
    final value = _reservableDateList;
    if (value == null) return null;
    if (_reservableDateList is EqualUnmodifiableListView)
      return _reservableDateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CreateBookingOutput? createBookingOutput;
  @override
  final ErrorObject? errorObject;
  @override
  final CreateBookingStatus status;

  @override
  String toString() {
    return 'CreateBookingBlocState(reservableDateList: $reservableDateList, createBookingOutput: $createBookingOutput, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateBookingBlocState &&
            const DeepCollectionEquality()
                .equals(other._reservableDateList, _reservableDateList) &&
            (identical(other.createBookingOutput, createBookingOutput) ||
                other.createBookingOutput == createBookingOutput) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reservableDateList),
      createBookingOutput,
      errorObject,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateBookingBlocStateCopyWith<_$_CreateBookingBlocState> get copyWith =>
      __$$_CreateBookingBlocStateCopyWithImpl<_$_CreateBookingBlocState>(
          this, _$identity);
}

abstract class _CreateBookingBlocState implements CreateBookingBlocState {
  const factory _CreateBookingBlocState(
      {required final List<ReservableDate>? reservableDateList,
      required final CreateBookingOutput? createBookingOutput,
      required final ErrorObject? errorObject,
      required final CreateBookingStatus status}) = _$_CreateBookingBlocState;

  @override
  List<ReservableDate>? get reservableDateList;
  @override
  CreateBookingOutput? get createBookingOutput;
  @override
  ErrorObject? get errorObject;
  @override
  CreateBookingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_CreateBookingBlocStateCopyWith<_$_CreateBookingBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
