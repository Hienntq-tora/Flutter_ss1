import 'package:time_tracker/domain/entities/default_output.dart';
import 'package:time_tracker/domain/entities/post_report_input.dart';
import 'package:time_tracker/domain/repositories/app_repository.dart';
import 'package:time_tracker/domain/usecases/usecase.dart';

class PostReportUsecase
    extends UseCase<DefaultOutput, PostReportUseCaseParams> {
  final AppRepository repository;

  const PostReportUsecase(this.repository);

  @override
  Future<DefaultOutput> call(PostReportUseCaseParams params) async {
    var result = await repository.postReport(PostReportInput(
      lessonId: params.lessonId,
      reportType: params.reportType,
      description: params.description,
    ));

    return result;
  }
}

class PostReportUseCaseParams {
  String? lessonId;
  String reportType;
  String? description;
  PostReportUseCaseParams({
    required this.lessonId,
    required this.reportType,
    required this.description,
  });
}
