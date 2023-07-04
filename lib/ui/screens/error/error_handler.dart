import 'package:flutter/material.dart';
import 'package:time_tracker/core/error_handling/error_object.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/ui/components/dialogs/fail_dialog.dart';

import '../../../routes/route_utils.dart';
import '../login/auth_cubit.dart';

class ErrorHandler {
  static void showError(context, ErrorObject errorObject,
      {AppPage? page, VoidCallback? onClose}) {
    switch (page) {
      case AppPage.login:
        LoginErrorHandler.showError(context, errorObject);
        break;
      case AppPage.home:
      case AppPage.error:
      case AppPage.searchLesson:
      case AppPage.createAccountSelectRole:
      case AppPage.createAccountEnterInfo:
      case AppPage.lessonStart:
      case AppPage.searchTutor:
      case AppPage.tutorDetail:
      case AppPage.comment:
      case AppPage.studentTutorAvailableTime:
      case AppPage.studentTutorLessons:
      case AppPage.updateInformation:
      case AppPage.tutorUpdateInformation:
      case AppPage.changePassword:
      case AppPage.report:
      case AppPage.tutorHome:
      case AppPage.tutorLesson:
      case AppPage.tutorUpdateSchedule:
      case AppPage.tutorUpdateLesson:
      case AppPage.tutorFeedback:
      case AppPage.tutorNotification:
      case AppPage.registerProcess:
      case AppPage.registerProcessReason:
      case null:
      default:
        final dialog = (errorObject.code == 'UnauthorizedRefreshTokenError')
            ? FailDialog('An error has been occurred', errorObject.message,
                onClose: (_) => di.sl<AuthCubit>().signOut())
            : FailDialog('An error has been occurred', errorObject.message,
                onClose: (_) => onClose?.call());
        dialog.show(context);
        break;
    }
  }

  static void showLocalError(context, String? title, String? message) {
    final dialog = FailDialog(title ?? '', message ?? '');
    dialog.show(context);
  }
}

class LoginErrorHandler {
  static void showError(context, ErrorObject errorObject) {
    if (errorObject.code == 'UnauthorizedError') {
      final dialog = FailDialog('An error has been occurred',
          'These credentials do not match our records.', onClose: (_) {
        di.sl<AuthCubit>().signOut();
      });
      dialog.show(context);
      // if (errorObject.api == ApiEnum.ihd001) {
      //   // Do Something here to handle separate api
      // }
      return;
    }

    final dialog =
        FailDialog('An error has been occurred', errorObject.message);
    dialog.show(context);
  }
}
