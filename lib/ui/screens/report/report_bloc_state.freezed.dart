// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostReportBlocState {
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  PostReportStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostReportBlocStateCopyWith<PostReportBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReportBlocStateCopyWith<$Res> {
  factory $PostReportBlocStateCopyWith(
          PostReportBlocState value, $Res Function(PostReportBlocState) then) =
      _$PostReportBlocStateCopyWithImpl<$Res, PostReportBlocState>;
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      PostReportStatus status});
}

/// @nodoc
class _$PostReportBlocStateCopyWithImpl<$Res, $Val extends PostReportBlocState>
    implements $PostReportBlocStateCopyWith<$Res> {
  _$PostReportBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostReportStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostReportBlocStateCopyWith<$Res>
    implements $PostReportBlocStateCopyWith<$Res> {
  factory _$$_PostReportBlocStateCopyWith(_$_PostReportBlocState value,
          $Res Function(_$_PostReportBlocState) then) =
      __$$_PostReportBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      PostReportStatus status});
}

/// @nodoc
class __$$_PostReportBlocStateCopyWithImpl<$Res>
    extends _$PostReportBlocStateCopyWithImpl<$Res, _$_PostReportBlocState>
    implements _$$_PostReportBlocStateCopyWith<$Res> {
  __$$_PostReportBlocStateCopyWithImpl(_$_PostReportBlocState _value,
      $Res Function(_$_PostReportBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_PostReportBlocState(
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostReportStatus,
    ));
  }
}

/// @nodoc

class _$_PostReportBlocState implements _PostReportBlocState {
  const _$_PostReportBlocState(
      {required this.output, required this.errorObject, required this.status});

  @override
  final DefaultOutput? output;
  @override
  final ErrorObject? errorObject;
  @override
  final PostReportStatus status;

  @override
  String toString() {
    return 'PostReportBlocState(output: $output, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostReportBlocState &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, output, errorObject, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostReportBlocStateCopyWith<_$_PostReportBlocState> get copyWith =>
      __$$_PostReportBlocStateCopyWithImpl<_$_PostReportBlocState>(
          this, _$identity);
}

abstract class _PostReportBlocState implements PostReportBlocState {
  const factory _PostReportBlocState(
      {required final DefaultOutput? output,
      required final ErrorObject? errorObject,
      required final PostReportStatus status}) = _$_PostReportBlocState;

  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  PostReportStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_PostReportBlocStateCopyWith<_$_PostReportBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
