import '../../domain/errors/domain_error.dart';

class UnauthorizedRefreshTokenError extends DomainError {
  UnauthorizedRefreshTokenError({String message = ''})
      : super(message: message);
}
