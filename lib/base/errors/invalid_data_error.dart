import '../../data/resources/api_enum.dart';
import '../../domain/errors/domain_error.dart';

class InvalidDataError extends DomainError {
  InvalidDataError({String message = '', ApiEnum api = ApiEnum.unknown})
      : super(message: message, api: api);
}
