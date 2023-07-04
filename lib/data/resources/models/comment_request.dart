import 'package:json_annotation/json_annotation.dart';

part 'comment_request.g.dart';

@JsonSerializable()
class CommentRequest {
  const CommentRequest(this.bookingId, this.content, this.rating);

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);

  @JsonKey(name: 'bookingId', required: true)
  final String bookingId;

  @JsonKey(name: 'content', required: true)
  final String content;

  @JsonKey(name: 'rating', required: true)
  final double rating;
}
