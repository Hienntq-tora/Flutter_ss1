import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:time_tracker/base/errors/api_error.dart';
import 'package:time_tracker/base/errors/cloudinary_error.dart';
import 'package:time_tracker/base/errors/no_connection_error.dart';
import 'package:time_tracker/base/errors/time_out_error.dart';
import 'package:time_tracker/base/errors/unauthorized_error.dart';
import 'package:time_tracker/base/errors/unauthorized_refresh_token_error.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/utils/util.dart';

import '../../base/errors/invalid_data_error.dart';
import '../../base/errors/not_found_error.dart';
import '../../data/resources/api_enum.dart';
import '../../domain/errors/domain_error.dart';

class ErrorObject extends Equatable {
  const ErrorObject(
      {required this.title,
      required this.code,
      required this.message,
      this.api});

  final String title;
  final String code;
  final String message;
  final ApiEnum? api;

  @override
  List<Object?> get props => [title, message];

  /// Again, here I leverage the power of sealed_classes to write robust code and
  /// make sure to map evey and each failure with a specific message to show in
  /// the UI.
  static ErrorObject mapErrorToErrorObject({required DomainError error}) {
    switch (error.runtimeType) {
      case ApiError:
        return ErrorObject(
            title: 'Error Code: ApiError',
            code: 'ApiError',
            message: LocaleKeys.errorApi.tr(),
            api: error.api);
      case InvalidDataError:
        return ErrorObject(
            title: 'Invalid Input',
            code: 'InvalidDataError',
            message: error.message.isEmptyOrNull
                ? LocaleKeys.errorInvalidData.tr()
                : error.message,
            api: error.api);
      case NoConnectionError:
        return ErrorObject(
            title: 'Error Code: NoConnectionError',
            code: 'NoConnectionError',
            message: LocaleKeys.errorNoConnection.tr(),
            api: error.api);
      case NotFoundError:
        return ErrorObject(
            title: 'Error Code: NotFoundError',
            code: 'NotFoundError',
            message: LocaleKeys.errorNotFound.tr(),
            api: error.api);
      case TimeOutError:
        return ErrorObject(
            title: 'Error Code: TimeOutError',
            code: 'TimeOutError',
            message: LocaleKeys.errorTimeOut.tr(),
            api: error.api);
      case UnauthorizedError:
        return ErrorObject(
            title: 'Error Code: UnauthorizedError',
            code: 'UnauthorizedError',
            message: LocaleKeys.errorUnauthorized.tr(),
            api: error.api);
      case UnauthorizedRefreshTokenError:
        return ErrorObject(
            title: 'Error Code: UnauthorizedRefreshTokenError',
            code: 'UnauthorizedRefreshTokenError',
            message: LocaleKeys.errorUnauthorizedRefreshToken.tr(),
            api: error.api);
      case CloudinaryError:
        return ErrorObject(
            title: 'Cloudinary Error',
            code: 'CloudinaryError',
            message: error.message,
            api: error.api);
      default:
        return const ErrorObject(
          title: 'Error Code: INTERNAL_SERVER_FAILURE',
          code: 'InternalError',
          message:
              'It seems that the server is not reachable at the moment 1, try '
              'again later, should the issue persist please reach out to the '
              'developer at a@b.com',
        );
    }
  }
}
