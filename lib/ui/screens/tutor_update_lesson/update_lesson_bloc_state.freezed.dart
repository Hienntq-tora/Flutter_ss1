// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_lesson_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateLessonBlocState {
  UpdateLessonStatus get status => throw _privateConstructorUsedError;
  List<Field>? get fields => throw _privateConstructorUsedError;
  Lesson? get lesson => throw _privateConstructorUsedError;
  CloudinaryResponse? get cloudinary => throw _privateConstructorUsedError;
  DefaultOutput? get updateLessonResponse => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateLessonBlocStateCopyWith<UpdateLessonBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLessonBlocStateCopyWith<$Res> {
  factory $UpdateLessonBlocStateCopyWith(UpdateLessonBlocState value,
          $Res Function(UpdateLessonBlocState) then) =
      _$UpdateLessonBlocStateCopyWithImpl<$Res, UpdateLessonBlocState>;
  @useResult
  $Res call(
      {UpdateLessonStatus status,
      List<Field>? fields,
      Lesson? lesson,
      CloudinaryResponse? cloudinary,
      DefaultOutput? updateLessonResponse,
      ErrorObject? errorObject});
}

/// @nodoc
class _$UpdateLessonBlocStateCopyWithImpl<$Res,
        $Val extends UpdateLessonBlocState>
    implements $UpdateLessonBlocStateCopyWith<$Res> {
  _$UpdateLessonBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fields = freezed,
    Object? lesson = freezed,
    Object? cloudinary = freezed,
    Object? updateLessonResponse = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateLessonStatus,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>?,
      lesson: freezed == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson?,
      cloudinary: freezed == cloudinary
          ? _value.cloudinary
          : cloudinary // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      updateLessonResponse: freezed == updateLessonResponse
          ? _value.updateLessonResponse
          : updateLessonResponse // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateLessonBlocStateCopyWith<$Res>
    implements $UpdateLessonBlocStateCopyWith<$Res> {
  factory _$$_UpdateLessonBlocStateCopyWith(_$_UpdateLessonBlocState value,
          $Res Function(_$_UpdateLessonBlocState) then) =
      __$$_UpdateLessonBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UpdateLessonStatus status,
      List<Field>? fields,
      Lesson? lesson,
      CloudinaryResponse? cloudinary,
      DefaultOutput? updateLessonResponse,
      ErrorObject? errorObject});
}

/// @nodoc
class __$$_UpdateLessonBlocStateCopyWithImpl<$Res>
    extends _$UpdateLessonBlocStateCopyWithImpl<$Res, _$_UpdateLessonBlocState>
    implements _$$_UpdateLessonBlocStateCopyWith<$Res> {
  __$$_UpdateLessonBlocStateCopyWithImpl(_$_UpdateLessonBlocState _value,
      $Res Function(_$_UpdateLessonBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fields = freezed,
    Object? lesson = freezed,
    Object? cloudinary = freezed,
    Object? updateLessonResponse = freezed,
    Object? errorObject = freezed,
  }) {
    return _then(_$_UpdateLessonBlocState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UpdateLessonStatus,
      fields: freezed == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<Field>?,
      lesson: freezed == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson?,
      cloudinary: freezed == cloudinary
          ? _value.cloudinary
          : cloudinary // ignore: cast_nullable_to_non_nullable
              as CloudinaryResponse?,
      updateLessonResponse: freezed == updateLessonResponse
          ? _value.updateLessonResponse
          : updateLessonResponse // ignore: cast_nullable_to_non_nullable
              as DefaultOutput?,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
    ));
  }
}

/// @nodoc

class _$_UpdateLessonBlocState implements _UpdateLessonBlocState {
  const _$_UpdateLessonBlocState(
      {required this.status,
      required final List<Field>? fields,
      required this.lesson,
      required this.cloudinary,
      required this.updateLessonResponse,
      required this.errorObject})
      : _fields = fields;

  @override
  final UpdateLessonStatus status;
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
  final Lesson? lesson;
  @override
  final CloudinaryResponse? cloudinary;
  @override
  final DefaultOutput? updateLessonResponse;
  @override
  final ErrorObject? errorObject;

  @override
  String toString() {
    return 'UpdateLessonBlocState(status: $status, fields: $fields, lesson: $lesson, cloudinary: $cloudinary, updateLessonResponse: $updateLessonResponse, errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateLessonBlocState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.cloudinary, cloudinary) ||
                other.cloudinary == cloudinary) &&
            (identical(other.updateLessonResponse, updateLessonResponse) ||
                other.updateLessonResponse == updateLessonResponse) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_fields),
      lesson,
      cloudinary,
      updateLessonResponse,
      errorObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateLessonBlocStateCopyWith<_$_UpdateLessonBlocState> get copyWith =>
      __$$_UpdateLessonBlocStateCopyWithImpl<_$_UpdateLessonBlocState>(
          this, _$identity);
}

abstract class _UpdateLessonBlocState implements UpdateLessonBlocState {
  const factory _UpdateLessonBlocState(
      {required final UpdateLessonStatus status,
      required final List<Field>? fields,
      required final Lesson? lesson,
      required final CloudinaryResponse? cloudinary,
      required final DefaultOutput? updateLessonResponse,
      required final ErrorObject? errorObject}) = _$_UpdateLessonBlocState;

  @override
  UpdateLessonStatus get status;
  @override
  List<Field>? get fields;
  @override
  Lesson? get lesson;
  @override
  CloudinaryResponse? get cloudinary;
  @override
  DefaultOutput? get updateLessonResponse;
  @override
  ErrorObject? get errorObject;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateLessonBlocStateCopyWith<_$_UpdateLessonBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
