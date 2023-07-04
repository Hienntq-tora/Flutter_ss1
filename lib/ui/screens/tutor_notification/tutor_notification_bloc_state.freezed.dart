// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_notification_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorNotificationBlocState {
  List<TutorNotification>? get data => throw _privateConstructorUsedError;
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  TutorNotificationStatus get tutorNotificationStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorNotificationBlocStateCopyWith<TutorNotificationBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorNotificationBlocStateCopyWith<$Res> {
  factory $TutorNotificationBlocStateCopyWith(TutorNotificationBlocState value,
          $Res Function(TutorNotificationBlocState) then) =
      _$TutorNotificationBlocStateCopyWithImpl<$Res,
          TutorNotificationBlocState>;
  @useResult
  $Res call(
      {List<TutorNotification>? data,
      DefaultOutput? output,
      ErrorObject? errorObject,
      TutorNotificationStatus tutorNotificationStatus});
}

/// @nodoc
class _$TutorNotificationBlocStateCopyWithImpl<$Res,
        $Val extends TutorNotificationBlocState>
    implements $TutorNotificationBlocStateCopyWith<$Res> {
  _$TutorNotificationBlocStateCopyWithImpl(this._value, this._then);

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
    Object? tutorNotificationStatus = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TutorNotification>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      tutorNotificationStatus: null == tutorNotificationStatus
          ? _value.tutorNotificationStatus
          : tutorNotificationStatus // ignore: cast_nullable_to_non_nullable
              as TutorNotificationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorNotificationBlocStateCopyWith<$Res>
    implements $TutorNotificationBlocStateCopyWith<$Res> {
  factory _$$_TutorNotificationBlocStateCopyWith(
          _$_TutorNotificationBlocState value,
          $Res Function(_$_TutorNotificationBlocState) then) =
      __$$_TutorNotificationBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TutorNotification>? data,
      DefaultOutput? output,
      ErrorObject? errorObject,
      TutorNotificationStatus tutorNotificationStatus});
}

/// @nodoc
class __$$_TutorNotificationBlocStateCopyWithImpl<$Res>
    extends _$TutorNotificationBlocStateCopyWithImpl<$Res,
        _$_TutorNotificationBlocState>
    implements _$$_TutorNotificationBlocStateCopyWith<$Res> {
  __$$_TutorNotificationBlocStateCopyWithImpl(
      _$_TutorNotificationBlocState _value,
      $Res Function(_$_TutorNotificationBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? tutorNotificationStatus = null,
  }) {
    return _then(_$_TutorNotificationBlocState(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TutorNotification>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      tutorNotificationStatus: null == tutorNotificationStatus
          ? _value.tutorNotificationStatus
          : tutorNotificationStatus // ignore: cast_nullable_to_non_nullable
              as TutorNotificationStatus,
    ));
  }
}

/// @nodoc

class _$_TutorNotificationBlocState implements _TutorNotificationBlocState {
  const _$_TutorNotificationBlocState(
      {required final List<TutorNotification>? data,
      required this.output,
      required this.errorObject,
      required this.tutorNotificationStatus})
      : _data = data;

  final List<TutorNotification>? _data;
  @override
  List<TutorNotification>? get data {
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
  final TutorNotificationStatus tutorNotificationStatus;

  @override
  String toString() {
    return 'TutorNotificationBlocState(data: $data, output: $output, errorObject: $errorObject, tutorNotificationStatus: $tutorNotificationStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorNotificationBlocState &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(
                    other.tutorNotificationStatus, tutorNotificationStatus) ||
                other.tutorNotificationStatus == tutorNotificationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      output,
      errorObject,
      tutorNotificationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorNotificationBlocStateCopyWith<_$_TutorNotificationBlocState>
      get copyWith => __$$_TutorNotificationBlocStateCopyWithImpl<
          _$_TutorNotificationBlocState>(this, _$identity);
}

abstract class _TutorNotificationBlocState
    implements TutorNotificationBlocState {
  const factory _TutorNotificationBlocState(
          {required final List<TutorNotification>? data,
          required final DefaultOutput? output,
          required final ErrorObject? errorObject,
          required final TutorNotificationStatus tutorNotificationStatus}) =
      _$_TutorNotificationBlocState;

  @override
  List<TutorNotification>? get data;
  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  TutorNotificationStatus get tutorNotificationStatus;
  @override
  @JsonKey(ignore: true)
  _$$_TutorNotificationBlocStateCopyWith<_$_TutorNotificationBlocState>
      get copyWith => throw _privateConstructorUsedError;
}
