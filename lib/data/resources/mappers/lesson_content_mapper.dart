import 'package:time_tracker/data/resources/models/lesson_content_dto.dart';
import 'package:time_tracker/domain/entities/lesson_content.dart';

extension ListLessonContentDtoX on List<LessonContentDto> {
  List<LessonContent> toEntityList() {
    return map(
      (e) => LessonContent(e.title, e.description),
    ).toList();
  }
}
