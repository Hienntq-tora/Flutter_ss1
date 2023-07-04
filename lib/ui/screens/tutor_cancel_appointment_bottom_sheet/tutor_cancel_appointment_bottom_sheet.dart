import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/secondary_button.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_home/tutor_home_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import '../../../l10n/locale_keys.g.dart';

class TutorCancelAppointmentBottomSheet {
  TutorCancelAppointmentBottomSheet(this.appointmentId);

  final String appointmentId;

  final cubit = di.sl<TutorHomeCubit>();
  final _formKey = GlobalKey<FormState>();
  final _cancelReasonController = TextEditingController();

  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;

  void close({required bool isCancelled}) {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!, isCancelled);
      _bottomSheetIsOpen = false;
    }
  }

  Future<bool?> show(BuildContext context) async {
    _context = context;
    if (_context != null) {
      _bottomSheetIsOpen = true;
      return await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: _buildPage,
      );
    }
    return Future.value(false);
  }

  Widget _buildPage(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<TutorHomeCubit, TutorHomeBlocState>(
        listener: (context, state) {
          if (state.status == TutorHomeStatus.cancelAppointmentSuccess) {
            close(isCancelled: true);
          }

          if (state.status == TutorHomeStatus.loadFailure) {
            ErrorHandler.showError(context, state.errorObject!);
          }
        },
        builder: (context, state) {
          return LoadingContainer(
            isLoading: state.status == TutorHomeStatus.loading,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        LocaleKeys.tutorCancelAppointmentTitle.tr(),
                        textAlign: TextAlign.center,
                        style: getToolBarTextStyle(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        LocaleKeys.tutorCancelAppointmentHeader.tr(),
                        style: getBody1TextStyle(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: _formKey,
                        child: TextAreaFormField(
                          hintText: LocaleKeys.fieldDescriptionHint.tr(),
                          maxLines: 5,
                          minLines: 5,
                          controller: _cancelReasonController,
                          onChanged: (value) {},
                          validator: SupportValidators.compose([
                            SupportValidators.required(
                                fieldName: LocaleKeys.fieldDescription.tr()),
                            SupportValidators.inRangeLength(1, 256,
                                fieldName: LocaleKeys.fieldDescription.tr()),
                            SupportValidators.description(
                                fieldName: LocaleKeys.fieldDescription.tr()),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 30),
                      child: Column(
                        children: [
                          Button(
                            text: LocaleKeys.tutorCancelAppointmentSubmit.tr(),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                cubit.cancelAppoinment(
                                  id: appointmentId,
                                  cancelReason: _cancelReasonController.text,
                                  isCancel: true,
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 16.0),
                          SecondaryButton(
                            text: LocaleKeys.tutorCancelAppointmentCancel.tr(),
                            onPressed: () => close(isCancelled: false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
