import 'package:time_tracker/domain/entities/comment.dart';
import 'package:time_tracker/domain/entities/working_experience.dart';

import 'education.dart';

class Tutor {
  const Tutor(
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

  final String id;

  final String? email;

  final String avatarUrl;

  final String? fullName;

  final String? countryFlag;

  final double? ratings;

  final String? aboutMe;

  final int? role;

  final String? profileVideoUrl;

  final String? location;

  final List<String>? languagesSubjects;

  final List<WorkingExperience>? workingExperiences;

  final List<Education>? educations;

  final List<String>? certificates;

  final List<Comment>? comments;
}
