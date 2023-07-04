
import 'package:time_tracker/domain/entities/education.dart';

import '../models/education_dto.dart';

extension EducationDtoX on EducationDto {
  Education toEntity() {
    return Education(title, description);
  }
}

extension EducationX on Education {
  EducationDto toDto() {
    return EducationDto(title, description);
  }
}
