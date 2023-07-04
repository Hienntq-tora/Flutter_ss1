import 'package:time_tracker/data/resources/mappers/comment_mapper.dart';
import 'package:time_tracker/data/resources/mappers/education_mapper.dart';
import 'package:time_tracker/data/resources/mappers/working_experience_mapper.dart';
import 'package:time_tracker/data/resources/models/get_tutors_request.dart';
import 'package:time_tracker/data/resources/models/tutor_dto.dart';
import 'package:time_tracker/domain/entities/get_tutors_input.dart';
import 'package:time_tracker/domain/entities/tutor.dart';

extension TutorDtoX on TutorDto {
  Tutor toEntity() {
    return Tutor(
      id,
      email,
      avatarUrl,
      fullName,
      countryFlag,
      ratings,
      aboutMe,
      role,
      profileVideoUrl,
      location,
      languagesSubjects,
      workingExperiences?.map((e) => e.toEntity()).toList(),
      educations?.map((e) => e.toEntity()).toList(),
      certificates,
      comments?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension GetTutorsRequestX on GetTutorsInput {
  GetTutorsRequest toDto() {
    return GetTutorsRequest(search);
  }
}
