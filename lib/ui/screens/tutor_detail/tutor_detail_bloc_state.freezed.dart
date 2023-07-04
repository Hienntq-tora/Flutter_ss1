// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutor_detail_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorDetailBlocState {
  TutorDetailStatus get status => throw _privateConstructorUsedError;
  Tutor? get tutor => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorDetailBlocStateCopyWith<TutorDetailBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorDetailBlocStateCopyWith<$Res> {
  factory $TutorDetailBlocStateCopyWith(TutorDetailBlocState value,
          $Res Function(TutorDetailBlocState) then) =
      _$TutorDetailBlocStateCopyWithImpl<$Res, TutorDetailBlocState>;
  @useResult
  $Res call({TutorDetailStatus status, Tutor? tutor, ErrorObject? errorObject});
}

/// @nodoc
class _$TutorDetailBlocStateCopyWithImpl<$Res,
        $Val extends TutorDetailBlocState>
    implements $TutorDetailBlocStateCopyWith<$Res> {
  _$TutorDetailBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tutor = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TutorDetailStatus,
      tutor: freezed == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorDetailBlocStateCopyWith<$Res>
    implements $TutorDetailBlocStateCopyWith<$Res> {
  factory _$$_TutorDetailBlocStateCopyWith(_$_TutorDetailBlocState value,
          $Res Function(_$_TutorDetailBlocState) then) =
      __$$_TutorDetailBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TutorDetailStatus status, Tutor? tutor, ErrorObject? errorObject});
}

/// @nodoc
class __$$_TutorDetailBlocStateCopyWithImpl<$Res>
    extends _$TutorDetailBlocStateCopyWithImpl<$Res, _$_TutorDetailBlocState>
    implements _$$_TutorDetailBlocStateCopyWith<$Res> {
  __$$_TutorDetailBlocStateCopyWithImpl(_$_TutorDetailBlocState _value,
      $Res Function(_$_TutorDetailBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tutor = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_$_TutorDetailBlocState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TutorDetailStatus,
      tutor: freezed == tutor
          ? _value.tutor
          : tutor // ignore: cast_nullable_to_non_nullable
              as Tutor?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ));
  }
}

/// @nodoc

class _$_TutorDetailBlocState implements _TutorDetailBlocState {
  const _$_TutorDetailBlocState(
      {required this.status, required this.tutor, required this.errorObject});

  @override
  final TutorDetailStatus status;
  @override
  final Tutor? tutor;
  @override
  final ErrorObject? errorObject;

  @override
  String toString() {
    return 'TutorDetailBlocState(status: $status, tutor: $tutor, errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorDetailBlocState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tutor, tutor) || other.tutor == tutor) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, tutor, errorObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorDetailBlocStateCopyWith<_$_TutorDetailBlocState> get copyWith =>
      __$$_TutorDetailBlocStateCopyWithImpl<_$_TutorDetailBlocState>(
          this, _$identity);
}

abstract class _TutorDetailBlocState implements TutorDetailBlocState {
  const factory _TutorDetailBlocState(
      {required final TutorDetailStatus status,
      required final Tutor? tutor,
      required final ErrorObject? errorObject}) = _$_TutorDetailBlocState;

  @override
  TutorDetailStatus get status;
  @override
  Tutor? get tutor;
  @override
  ErrorObject? get errorObject;
  @override
  @JsonKey(ignore: true)
  _$$_TutorDetailBlocStateCopyWith<_$_TutorDetailBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
