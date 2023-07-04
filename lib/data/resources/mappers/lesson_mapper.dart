import 'package:time_tracker/data/resources/mappers/field_mapper.dart';
import 'package:time_tracker/data/resources/mappers/lesson_content_mapper.dart';
import 'package:time_tracker/data/resources/mappers/user_mapper.dart';
import 'package:time_tracker/data/resources/models/get_lessons_by_tutor_request.dart';
import 'package:time_tracker/data/resources/models/lesson_dto.dart';
import 'package:time_tracker/domain/entities/get_lessons_by_tutor_input.dart';
import 'package:time_tracker/domain/entities/get_lessons_input.dart';
import 'package:time_tracker/domain/entities/lesson.dart';

import '../models/get_lessons_request.dart';

extension LessonDtoX on LessonDto {
  Lesson toEntity() {
    return Lesson(
      id: id,
      title: title,
      imageUrl: imageUrl,
      description: description,
      difficulty: difficulty,
      price: price,
      length: length,
      rating: rating,
      dateTime: dateTime,
      user: user?.toEntity(),
      linkMeeting: linkMeeting,
      field: field?.toEntity(),
      content: content?.toEntityList(),
    );
  }
}

extension GetLessonsInputX on GetLessonsInput {
  GetLessonsRequest toDto() {
    return GetLessonsRequest(filter, tutorId, search, fieldId, difficult);
  }
}

extension GetLessonsByTutorInputX on GetLessonsByTutorInput {
  GetLessonsByTutorRequest toDto() {
    return GetLessonsByTutorRequest(teacherId);
  }
}
