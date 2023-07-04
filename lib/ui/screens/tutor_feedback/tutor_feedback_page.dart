import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/domain/entities/tutor_feedback_input.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/dialogs/success_dialog.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/tutor_feedback/tutor_feedback_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_feedback/tutor_feedback_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/core/services/injection.dart' as di;

import '../../../configs/font_manager.dart';

class TuTorFeedback extends StatefulWidget {
  const TuTorFeedback({super.key, this.initialDate});
  final String? initialDate;

  @override
  State<TuTorFeedback> createState() => _TuTorFeedbackState();
}

class _TuTorFeedbackState extends State<TuTorFeedback> {
  TutorFeedbackInput descriptions =
      TutorFeedbackInput(description: '');

  final _formKey = GlobalKey<FormState>();
  final _feedbackFieldController = TextEditingController();
  var cubit = di.sl<TutorFeedbackCubit>();

  @override
  Widget build(BuildContext context) {
    final successDialog = SuccessDialog(
      LocaleKeys.tutorFeedbackSuccessTitle.tr(),
      "",
      onClose: (value) {
        context.pop();
      },
    );
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<TutorFeedbackCubit,
          TutorFeedbackBlocState>(
        listener: (context, state) {
          if (state.status == TutorFeedbackStatus.sendFeedbackSuccess) {
            successDialog.show(context);
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: LoadingContainer(
              isLoading: state.status == TutorFeedbackStatus.loading,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: Header(
                  title: LocaleKeys.tutorFeedbackTitle.tr(),
                  backPress: () => context.pop(),
                ),
                body: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          LocaleKeys.tutorFeedbackHeader.tr(),
                          style: getBody1TextStyle(),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                          key: _formKey,
                          child: SizedBox(
                            child: TextAreaFormField(
                              keyboardType: TextInputType.multiline,
                              hintText: 'Your feedback ..',
                              maxLines: 4,
                              minLines: 4,
                              controller: _feedbackFieldController,
                              onChanged: (value) {},
                              validator: SupportValidators.compose([
                                  SupportValidators.required(
                                      fieldName: "Your feedback.."),
                                  SupportValidators.inRangeLength(1, 256,
                                      fieldName: LocaleKeys.tutorFeedbackTitle.tr()),
                                  SupportValidators.description(
                                      fieldName: LocaleKeys.tutorFeedbackTitle.tr()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                cubit.sendFeedback(_feedbackFieldController.text);
                              }
                            },
                            child: Text(
                              LocaleKeys.tutorFeedbackButton.tr(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
