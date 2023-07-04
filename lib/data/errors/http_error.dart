import 'package:time_tracker/base/errors/no_connection_error.dart';

import '../../../base/errors/api_error.dart';
import '../../../base/errors/invalid_data_error.dart';
import '../../../base/errors/not_found_error.dart';
import '../../../base/errors/time_out_error.dart';
import '../../../base/errors/unauthorized_error.dart';
import '../../../base/errors/unauthorized_refresh_token_error.dart';
import '../../../domain/errors/domain_error.dart';
import '../resources/api_enum.dart';

abstract class HttpError extends DomainError {
  const HttpError._({String message = ''}) : super(message: message);

  factory HttpError.badRequest({String message = ''}) =>
      _BadRequest(message: message);

  factory HttpError.unauthorized({String message = ''}) =>
      _Unauthorized(message: message);

  factory HttpError.unauthorizedRefreshToken({String message = ''}) =>
      _UnauthorizedRefreshToken(message: message);

  factory HttpError.forbidden({String message = ''}) =>
      _Forbidden(message: message);

  factory HttpError.notFound({String message = ''}) =>
      _NotFound(message: message);

  factory HttpError.invalidData({String message = ''}) =>
      _InvalidData(message: message);

  factory HttpError.timeOut({String message = ''}) =>
      _TimeOut(message: message);

  factory HttpError.serverError({String message = ''}) =>
      _ServerError(message: message);

  factory HttpError.noInternet({String message = ''}) =>
      _NoInternet(message: message);
}

class _BadRequest extends HttpError {
  _BadRequest({String message = ''}) : super._(message: message);
}

class _Unauthorized extends HttpError {
  _Unauthorized({String message = ''}) : super._(message: message);
}

class _UnauthorizedRefreshToken extends HttpError {
  _UnauthorizedRefreshToken({String message = ''}) : super._(message: message);
}

class _Forbidden extends HttpError {
  _Forbidden({String message = ''}) : super._(message: message);
}

class _NotFound extends HttpError {
  _NotFound({String message = ''}) : super._(message: message);
}

class _InvalidData extends HttpError {
  _InvalidData({String message = ''}) : super._(message: message);
}

class _TimeOut extends HttpError {
  _TimeOut({String message = ''}) : super._(message: message);
}

class _ServerError extends HttpError {
  _ServerError({String message = ''}) : super._(message: message);
}

class _NoInternet extends HttpError {
  _NoInternet({String message = ''}) : super._(message: message);
}

extension ConvertToBaseError on HttpError {
  /// Convert HttpError to BaseError equivalent
  DomainError convertError({ApiEnum api = ApiEnum.unknown}) {
    switch (runtimeType) {
      case _BadRequest:
        return InvalidDataError(message: message, api: api);
      case _Unauthorized:
        return UnauthorizedError(message: message);
      case _UnauthorizedRefreshToken:
        return UnauthorizedRefreshTokenError(message: message);
      case _Forbidden:
        return UnauthorizedError(message: message);
      case _NotFound:
        return NotFoundError(message: message, api: api);
      case _InvalidData:
        return InvalidDataError(message: message, api: api);
      case _TimeOut:
        return TimeOutError(message: message);
      case _ServerError:
        return ApiError(message: message, api: api);
      case _NoInternet:
        return NoConnectionError(message: message);
      default:
        return ApiError(message: message, api: api);
    }
  }
}
