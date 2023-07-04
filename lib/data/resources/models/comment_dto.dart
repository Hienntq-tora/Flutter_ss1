import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  const CommentDto(this.id, this.fullName, this.email, this.avatar,
      this.content, this.rating, this.createdAt);

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'fullName', required: false)
  final String? fullName;

  @JsonKey(name: 'email', required: true)
  final String email;

  @JsonKey(name: 'avataUrl', required: false)
  final String? avatar;

  @JsonKey(name: 'comment', required: false)
  final String? content;

  @JsonKey(name: 'rating', required: false)
  final double? rating;

  @JsonKey(name: 'createdAt', required: false)
  final String? createdAt;
}
