import 'package:json_annotation/json_annotation.dart';
import 'package:time_tracker/data/resources/models/education_dto.dart';
import 'package:time_tracker/data/resources/models/working_experience_dto.dart';

import 'comment_dto.dart';

part 'tutor_dto.g.dart';

@JsonSerializable()
class TutorDto {
  const TutorDto(
      this.id,
      this.email,
      this.avatarUrl,
      this.fullName,
      this.countryFlag,
      this.ratings,
      this.aboutMe,
      this.role,
      this.profileVideoUrl,
      this.location,
      this.languagesSubjects,
      this.workingExperiences,
      this.educations,
      this.certificates, this.comments);

  factory TutorDto.fromJson(Map<String, dynamic> json) =>
      _$TutorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TutorDtoToJson(this);

  @JsonKey(name: '_id', required: true)
  final String id;

  @JsonKey(name: 'email', required: false)
  final String? email;

  @JsonKey(name: 'avatarUrl', required: false)
  final String avatarUrl;

  @JsonKey(name: 'fullName', required: false)
  final String? fullName;

  @JsonKey(name: 'countryFlag', required: false)
  final String? countryFlag;

  @JsonKey(name: 'ratings', required: false)
  final double? ratings;

  @JsonKey(name: 'aboutMe', required: false)
  final String? aboutMe;

  @JsonKey(name: 'role', required: false)
  final int? role;

  @JsonKey(name: 'profileVideoUrl', required: false)
  final String? profileVideoUrl;

  @JsonKey(name: 'location', required: false)
  final String? location;

  @JsonKey(name: 'languagesSubjects', required: false)
  final List<String>? languagesSubjects;

  @JsonKey(name: 'workingExperiences', required: false)
  final List<WorkingExperienceDto>? workingExperiences;

  @JsonKey(name: 'educations', required: false)
  final List<EducationDto>? educations;

  @JsonKey(name: 'certificates', required: false)
  final List<String>? certificates;

  @JsonKey(name: 'commentList', required: false)
  final List<CommentDto>? comments;
}
