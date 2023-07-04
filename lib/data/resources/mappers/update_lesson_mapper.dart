import 'dart:convert';

import 'package:time_tracker/data/resources/models/lesson_content_dto.dart';
import 'package:time_tracker/data/resources/models/lesson_detail_request.dart';
import 'package:time_tracker/data/resources/models/update_lesson_request.dart';
import 'package:time_tracker/domain/entities/lesson_detail_input.dart';
import 'package:time_tracker/domain/entities/update_lesson_input.dart';

extension LessonDetailRequestX on LessonDetailInput {
  LessonDetailRequest toDto() {
    return LessonDetailRequest(lessonId);
  }
}

extension UpdateLessonRequestX on UpdateLessonInput {
  UpdateLessonRequest toDto() {
    final String jsonStr = content.map((value) {
      final json = LessonContentDto(value.title, value.description).toJson();
      return jsonEncode(json);
    }).join(",");
    return UpdateLessonRequest(
      imageUrl: imageUrl,
      lessonId: lessonId,
      title: title,
      description: description,
      fieldId: fieldId,
      content: "[$jsonStr]",
      difficulty: difficulty,
      price: price,
      linkMeeting: linkMeeting,
    );
  }
}
