import 'package:json_annotation/json_annotation.dart';

part 'response_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseWrapper<T> {
  const ResponseWrapper(this.status, this.message, this.data);

  @JsonKey(name: 'status', required: true)
  final int status;

  @JsonKey(name: 'message', required: true)
  final String message;

  @JsonKey(name: 'data', required: false)
  final T data;

  factory ResponseWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseWrapperToJson(this, toJsonT);
}
