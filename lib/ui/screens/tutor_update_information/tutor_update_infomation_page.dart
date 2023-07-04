import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/constants/constant.dart';
import 'package:time_tracker/core/services/injection.dart' as di;
import 'package:time_tracker/data/resources/local_data_resource.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/forms/default_form_field.dart';
import 'package:time_tracker/ui/components/forms/image_form.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/tutor_update_information/tutor_update_info_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_update_information/tutor_update_info_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/utils/util.dart';

class TutorUpdateInfomationPage extends StatefulWidget {
  const TutorUpdateInfomationPage({super.key});

  @override
  State<TutorUpdateInfomationPage> createState() =>
      _TutorUpdateInfomationPageState();
}

class _TutorUpdateInfomationPageState extends State<TutorUpdateInfomationPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final userData = di.sl<LocalDataResource>().getUserData();
  final tutorUpdateInfoCubit = di.sl<TutorUpdateInfoCubit>();

  File? _imageFile;

  void _onUpdateButtonPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      tutorUpdateInfoCubit.updateInformation(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        imageFile: _imageFile,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.text = userData.firstName;
    _lastNameController.text = userData.lastName;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<TutorUpdateInfoCubit>(
          create: (context) => tutorUpdateInfoCubit,
          child: BlocConsumer<TutorUpdateInfoCubit, TutorUpdateInfoBlocState>(
            listener: (context, state) {
              if (state.status == TutorUpdateInfoStatus.updateInfoSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(LocaleKeys.updateInfoSuccess.tr()),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Header(
                    title: LocaleKeys.tutorProfileTitle.tr(),
                    backPress: () => context.pop(),
                  ),
                  Expanded(
                    child: LoadingContainer(
                      isLoading: state.status == TutorUpdateInfoStatus.loading,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 54),
                            ImageForm(
                              width: 120,
                              height: 120,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60.0)),
                              imageUrl: userData.avatarUrl.isValidImageLink
                                  ? userData.avatarUrl
                                  : defaultImageUrl,
                              onCompleted: (file) => _imageFile = file,
                            ),
                            const SizedBox(height: 54),
                            Form(
                              key: _formKey,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DefaultFormField(
                                        labelText:
                                            "${LocaleKeys.fieldFirstNameHint.tr()}*",
                                        hintText:
                                            "${LocaleKeys.fieldFirstNameHint.tr()}*",
                                        maxLength: 20,
                                        counterText: "",
                                        controller: _firstNameController,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (value) {},
                                        validator: SupportValidators.compose([
                                          SupportValidators.required(
                                            fieldName:
                                                LocaleKeys.fieldFirstName.tr(),
                                          ),
                                          SupportValidators.name(
                                            fieldName:
                                                LocaleKeys.fieldFirstName.tr(),
                                          ),
                                        ])),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: DefaultFormField(
                                      labelText:
                                          "${LocaleKeys.fieldLastNameHint.tr()}*",
                                      hintText:
                                          "${LocaleKeys.fieldLastNameHint.tr()}*",
                                      maxLength: 20,
                                      counterText: "",
                                      controller: _lastNameController,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {},
                                      validator: SupportValidators.compose([
                                        SupportValidators.required(
                                          fieldName:
                                              LocaleKeys.fieldLastName.tr(),
                                        ),
                                        SupportValidators.name(
                                          fieldName:
                                              LocaleKeys.fieldLastName.tr(),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Button(
                              text: LocaleKeys.updateInfoSubmit.tr(),
                              onPressed: _onUpdateButtonPressed,
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
