import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/icon_manager.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/enums/difficulty.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/dialogs/confirm_dialog.dart';
import 'package:time_tracker/ui/components/forms/default_form_field.dart';
import 'package:time_tracker/ui/components/forms/image_form.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/components/header/header.dart';
import 'package:time_tracker/ui/components/loading_container.dart';
import 'package:time_tracker/ui/screens/error/error_handler.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/tutor_update_content.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/update_lesson_bloc_state.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/update_lesson_cubit.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/ui/validations/validators.dart';
import 'package:time_tracker/utils/util.dart';
import '../../../data/resources/extra/extra.dart';
import '../../../domain/entities/lesson.dart';
import '../../components/forms/dropdown_filter_form_field.dart';
import 'components/see_more_content_view.dart';
import 'components/tutor_content_tile.dart';
import 'package:time_tracker/core/services/injection.dart' as di;

class TutorUpdateLesson extends StatefulWidget {
  const TutorUpdateLesson({
    super.key,
    required this.type,
    this.lessonId,
  });

  final TutorUpdateLessonType type;
  final String? lessonId;

  @override
  State<TutorUpdateLesson> createState() => _TutorUpdateLessonState();
}

class _TutorUpdateLessonState extends State<TutorUpdateLesson> {
  final _formKey = GlobalKey<FormState>();
  final _imageFormKey = GlobalKey<ImageFormState>();
  final cubit = di.sl<UpdateLessonCubit>();

  int _selectdFieldIndex = 0;
  int _selectedDifficultyIndex = 0;
  List<Field> _fields = [];
  List<TutorContentModel> _contents = [];
  File? _imageFile;
  Lesson? lesson;

  final List<Field> _difficulties = Difficulty.values
      .map(
        (difficulty) => Field(
          id: UniqueKey().toString(),
          name: difficulty.toName,
        ),
      )
      .toList();

  final Map<String, TextEditingController> _controllers = {
    for (var name in ["title", "description", "classroom", "price"])
      name: TextEditingController()
  };

  void _showUpdateContentBottomSheet() {
    final updateContentBottomSheet = UpdateContentBottomSheet(
      contents: _contents,
      onClosed: (contents) {
        setState(() {
          _contents = contents;
        });
      },
    );
    updateContentBottomSheet.show(context);
  }

  void _onBlocStateChanged(BuildContext context, UpdateLessonBlocState state) {
    if (state.status == UpdateLessonStatus.loadFieldListSuccess) {
      if (state.fields != null) {
        setState(() {
          _fields = state.fields!;
        });
        if (widget.lessonId != null) {
          cubit.getLessonDetail(lessonId: widget.lessonId!);
        }
      }
    }

    if (state.status == UpdateLessonStatus.loadLessonSuccess) {
      lesson = state.lesson;

      final fieldIndex =
          _fields.indexWhere((field) => field.id == lesson?.field?.id);
      if (fieldIndex.isValidIndex) {
        _selectdFieldIndex = fieldIndex;
      }

      final difficultyIndex = _difficulties
          .indexWhere((difficulty) => difficulty.name == lesson?.difficulty);
      if (difficultyIndex.isValidIndex) {
        _selectedDifficultyIndex = difficultyIndex;
      }

      if (lesson?.content?.isNotEmpty ?? false) {
        _contents = lesson!.content!
            .map((content) => TutorContentModel(
                  id: UniqueKey().toString(),
                  title: content.title ?? "",
                  description: content.description ?? "",
                ))
            .toList();
      }

      _controllers['title']?.text = lesson?.title ?? "";
      _controllers['description']?.text = lesson?.description ?? "";
      _controllers['classroom']?.text = lesson?.linkMeeting ?? "";
      _controllers['price']?.text = lesson?.price ?? "";

      setState(() {});
    }

    if (state.status == UpdateLessonStatus.updateLessonSuccess) {
      final confirmDialog = ConfirmDialog(
        message: state.updateLessonResponse?.message,
        onSubmit: () {
          context.pop();
        },
      );
      confirmDialog.show(context);
    }

    if (state.status == UpdateLessonStatus.loadFailure) {
      ErrorHandler.showError(context, state.errorObject!);
    }
  }

  @override
  void dispose() {
    _controllers.forEach((_, value) {
      value.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateLessonCubit>(
      create: (context) => cubit..getFieldList(),
      child: BlocConsumer<UpdateLessonCubit, UpdateLessonBlocState>(
        listener: _onBlocStateChanged,
        builder: (context, state) {
          return LoadingContainer(
            isLoading: state.status == UpdateLessonStatus.loading,
            child: Scaffold(
              appBar: Header(
                title: widget.type.title,
                backPress: () => context.pop(),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Form(
                      key: _formKey,
                      child: Wrap(
                        runSpacing: 16,
                        children: [
                          Center(
                            child: ImageForm(
                              key: _imageFormKey,
                              width: 140,
                              height: 100,
                              imagePadding:
                                  const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              placeholderImage: SvgPicture.asset(
                                IconManager.lessonPlaceholder,
                              ),
                              imageUrl: lesson?.imageUrl,
                              onCompleted: (file) {
                                _imageFile = file;
                              },
                              validator: SupportValidators.compose([
                                SupportValidators.fileRequired(
                                  fieldName: LocaleKeys.fieldImage.tr(),
                                  fileUrl: lesson?.imageUrl,
                                ),
                              ]),
                            ),
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              Text(
                                LocaleKeys.fieldHeadlineHint.tr(),
                                style: getBody1TextStyle(),
                              ),
                              DefaultFormField(
                                controller: _controllers['title'],
                                hintText: LocaleKeys.fieldHeadlineHint.tr(),
                                onChanged: (value) {},
                                validator: SupportValidators.compose([
                                  SupportValidators.required(
                                      fieldName: LocaleKeys.fieldHeadline.tr()),
                                  SupportValidators.inRangeLength(1, 100,
                                      fieldName: LocaleKeys.fieldHeadline.tr()),
                                  SupportValidators.name(
                                      fieldName: LocaleKeys.fieldHeadline.tr()),
                                ]),
                              ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              Text(
                                LocaleKeys.fieldDescriptionHint.tr(),
                                style: getBody1TextStyle(),
                              ),
                              TextAreaFormField(
                                hintText: LocaleKeys.fieldDescriptionHint.tr(),
                                maxLines: 5,
                                minLines: 5,
                                keyboardType: TextInputType.multiline,
                                controller: _controllers['description'],
                                onChanged: (value) {},
                                validator: SupportValidators.compose(
                                  [
                                    SupportValidators.required(
                                        fieldName:
                                            LocaleKeys.fieldDescription.tr()),
                                    SupportValidators.inRangeLength(1, 255,
                                        fieldName:
                                            LocaleKeys.fieldDescription.tr()),
                                    SupportValidators.description(
                                        fieldName:
                                            LocaleKeys.fieldDescription.tr()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              Text(
                                LocaleKeys.fieldTitle.tr(),
                                style: getBody1TextStyle(),
                              ),
                              DropdownFilterFormField(
                                defaultSelectedValue: _fields.isNotEmpty
                                    ? _fields[_selectdFieldIndex]
                                    : null,
                                items: _fields,
                                hint: LocaleKeys.fieldTitle.tr(),
                                validator: (value) => null,
                                onChanged: (value) {
                                  final selectedIndex = _fields.indexWhere(
                                    (field) => field.id == value?.id,
                                  );
                                  if (selectedIndex.isValidIndex) {
                                    setState(() {
                                      _selectdFieldIndex = selectedIndex;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 16,
                            children: [
                              Text(
                                LocaleKeys.fieldContentTitle.tr(),
                                style: getBody1TextStyle(),
                              ),
                              _contents.isEmpty
                                  ? Row(
                                      children: [
                                        const Spacer(),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed:
                                                _showUpdateContentBottomSheet,
                                            style: TextButton.styleFrom(
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    )
                                  : SeeMoreContentView(
                                      title: _contents.first.title,
                                      description: _contents.first.description,
                                      onPressed: _showUpdateContentBottomSheet,
                                    ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              Text(
                                LocaleKeys.classroomLinkTitle.tr(),
                                style: getBody1TextStyle(),
                              ),
                              DefaultFormField(
                                hintText:
                                    LocaleKeys.fieldClassroomLinkHint.tr(),
                                controller: _controllers['classroom'],
                                onChanged: (value) {},
                                validator: SupportValidators.compose([
                                  SupportValidators.required(
                                      fieldName:
                                          LocaleKeys.fieldClassroomLink.tr()),
                                  SupportValidators.link(
                                    errorText:
                                        LocaleKeys.validationClassroomLink.tr(),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              Text(
                                LocaleKeys.fieldDifficultyHint.tr(),
                                style: getBody1TextStyle(),
                              ),
                              DropdownFilterFormField(
                                defaultSelectedValue:
                                    _difficulties[_selectedDifficultyIndex],
                                items: _difficulties,
                                hint: LocaleKeys.fieldDifficultyHint.tr(),
                                validator: (value) => null,
                                onChanged: (value) {
                                  final index = _difficulties.indexWhere(
                                    (difficulty) => difficulty.id == value?.id,
                                  );
                                  if (index.isValidIndex) {
                                    setState(() {
                                      _selectedDifficultyIndex = index;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Wrap(
                                runSpacing: 8,
                                children: [
                                  Text(
                                    LocaleKeys.fieldPriceHint.tr(),
                                    style: getBody1TextStyle(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: DefaultFormField(
                                          hintText:
                                              LocaleKeys.fieldPriceHint.tr(),
                                          controller: _controllers['price'],
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              filterNumberRegex,
                                            ),
                                          ],
                                          onChanged: (value) {},
                                          validator: SupportValidators.compose([
                                            SupportValidators.required(
                                                fieldName:
                                                    LocaleKeys.fieldPrice.tr()),
                                          ]),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 48,
                                        alignment: Alignment.center,
                                        child: Text(
                                          LocaleKeys.currency.tr(),
                                          style: getBold18TextStyle(),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Button(
                                text: LocaleKeys.tutorUpdateLessonSubmit.tr(),
                                onPressed: () {
                                  final isValidForm =
                                      _formKey.currentState?.validate() ??
                                          false;
                                  final isValidImageForm =
                                      _imageFormKey.currentState?.validate() ??
                                          false;
                                  if (isValidForm && isValidImageForm) {
                                    cubit.updateLesson(
                                      lessonId: widget.lessonId,
                                      imageFile: _imageFile,
                                      title: _controllers['title']?.text ?? "",
                                      description:
                                          _controllers['description']?.text ??
                                              "",
                                      fieldId: _fields[_selectdFieldIndex].id,
                                      difficulty: _difficulties[
                                              _selectedDifficultyIndex]
                                          .name,
                                      price: _controllers['price']?.text ?? "",
                                      linkMeeting:
                                          _controllers['classroom']?.text ?? "",
                                      content: _contents,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
