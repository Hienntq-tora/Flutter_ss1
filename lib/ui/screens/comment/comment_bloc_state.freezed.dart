// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostCommentBlocState {
  DefaultOutput? get output => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  PostCommentStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCommentBlocStateCopyWith<PostCommentBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentBlocStateCopyWith<$Res> {
  factory $PostCommentBlocStateCopyWith(PostCommentBlocState value,
          $Res Function(PostCommentBlocState) then) =
      _$PostCommentBlocStateCopyWithImpl<$Res, PostCommentBlocState>;
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      PostCommentStatus status});
}

/// @nodoc
class _$PostCommentBlocStateCopyWithImpl<$Res,
        $Val extends PostCommentBlocState>
    implements $PostCommentBlocStateCopyWith<$Res> {
  _$PostCommentBlocStateCopyWithImpl(this._value, this._then);

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
              as PostCommentStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCommentBlocStateCopyWith<$Res>
    implements $PostCommentBlocStateCopyWith<$Res> {
  factory _$$_PostCommentBlocStateCopyWith(_$_PostCommentBlocState value,
          $Res Function(_$_PostCommentBlocState) then) =
      __$$_PostCommentBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DefaultOutput? output,
      ErrorObject? errorObject,
      PostCommentStatus status});
}

/// @nodoc
class __$$_PostCommentBlocStateCopyWithImpl<$Res>
    extends _$PostCommentBlocStateCopyWithImpl<$Res, _$_PostCommentBlocState>
    implements _$$_PostCommentBlocStateCopyWith<$Res> {
  __$$_PostCommentBlocStateCopyWithImpl(_$_PostCommentBlocState _value,
      $Res Function(_$_PostCommentBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? output = freezed,
    Object? errorObject = freezed,
    Object? status = null,
  }) {
    return _then(_$_PostCommentBlocState(
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
              as PostCommentStatus,
    ));
  }
}

/// @nodoc

class _$_PostCommentBlocState implements _PostCommentBlocState {
  const _$_PostCommentBlocState(
      {required this.output, required this.errorObject, required this.status});

  @override
  final DefaultOutput? output;
  @override
  final ErrorObject? errorObject;
  @override
  final PostCommentStatus status;

  @override
  String toString() {
    return 'PostCommentBlocState(output: $output, errorObject: $errorObject, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostCommentBlocState &&
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
  _$$_PostCommentBlocStateCopyWith<_$_PostCommentBlocState> get copyWith =>
      __$$_PostCommentBlocStateCopyWithImpl<_$_PostCommentBlocState>(
          this, _$identity);
}

abstract class _PostCommentBlocState implements PostCommentBlocState {
  const factory _PostCommentBlocState(
      {required final DefaultOutput? output,
      required final ErrorObject? errorObject,
      required final PostCommentStatus status}) = _$_PostCommentBlocState;

  @override
  DefaultOutput? get output;
  @override
  ErrorObject? get errorObject;
  @override
  PostCommentStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_PostCommentBlocStateCopyWith<_$_PostCommentBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
