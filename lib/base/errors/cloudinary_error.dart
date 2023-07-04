import '../../domain/errors/domain_error.dart';

class CloudinaryError extends DomainError {
  CloudinaryError({String message = ''}) : super(message: message);
}
