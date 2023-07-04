import 'package:time_tracker/data/resources/models/tutor_detail_request.dart';
import 'package:time_tracker/domain/entities/tutor_detail_input.dart';

extension GetTutorDetailInputX on GetTutorDetailInput {
  TutorDetailRequest toDto() {
    return TutorDetailRequest(id);
  }
}
