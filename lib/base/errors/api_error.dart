import '../../data/resources/api_enum.dart';
import '../../domain/errors/domain_error.dart';

class ApiError extends DomainError {
  ApiError({String message = '', ApiEnum api = ApiEnum.unknown})
      : super(message: message, api: api);
}
