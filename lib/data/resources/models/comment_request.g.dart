// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['bookingId', 'content', 'rating'],
  );
  return CommentRequest(
    json['bookingId'] as String,
    json['content'] as String,
    (json['rating'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CommentRequestToJson(CommentRequest instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'content': instance.content,
      'rating': instance.rating,
    };
