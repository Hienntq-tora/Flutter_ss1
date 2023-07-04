import 'package:time_tracker/data/resources/models/tutor_feedback_request.dart';
import 'package:time_tracker/domain/entities/tutor_feedback_input.dart';

extension FeedbackInputX on TutorFeedbackInput {
  GetFeedbackRequest toDto() {
    return GetFeedbackRequest(description);
  }
}
