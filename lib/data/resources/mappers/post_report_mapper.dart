import 'package:time_tracker/data/resources/models/report_request.dart';
import 'package:time_tracker/domain/entities/post_report_input.dart';

extension PostReportInputX on PostReportInput {
  ReportRequest toDto() {
    return ReportRequest(lessonId, reportType, description);
  }
}
