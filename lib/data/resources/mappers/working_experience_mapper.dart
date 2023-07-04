import '../../../domain/entities/working_experience.dart';
import '../models/working_experience_dto.dart';

extension WorkingExperienceDtoX on WorkingExperienceDto {
  WorkingExperience toEntity() {
    return WorkingExperience(title, description);
  }
}