import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/link_text_span.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/screens/tutor_update_lesson/components/tutor_content_tile.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';
import 'package:time_tracker/utils/util.dart';

import '../../components/forms/default_form_field.dart';

class UpdateContentBottomSheet {
  UpdateContentBottomSheet({
    required this.contents,
    this.onClosed,
  });

  List<TutorContentModel> contents;
  final Function(List<TutorContentModel> contents)? onClosed;

  final _maxAmount = 3;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _titleFocusNode = FocusNode();
  final _descriptionController = TextEditingController();
  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;
  late StateSetter _setState;
  TutorContentModel? _selectedContent;

  UpdateLessonContentState get contentState {
    if (_selectedContent != null) {
      return UpdateLessonContentState.update;
    }
    if (contents.length == _maxAmount) {
      return UpdateLessonContentState.full;
    }
    return UpdateLessonContentState.add;
  }

  void updateContent() {
    if (contentState == UpdateLessonContentState.add) {
      contents.add(
        TutorContentModel(
          id: UniqueKey().toString(),
          title: _titleController.text,
          description: _descriptionController.text,
        ),
      );
    }
    if (contentState == UpdateLessonContentState.update) {
      final index = contents.indexWhere((content) {
        return content.id == _selectedContent?.id;
      });
      if (index.isValidIndex) {
        contents[index] = contents[index].copyWith(
          title: _titleController.text,
          description: _descriptionController.text,
        );
        _selectedContent = null;
      }
    }
    _titleController.clear();
    _descriptionController.clear();
    _setState(() {});

    if (contentState == UpdateLessonContentState.add) {
      _titleFocusNode.requestFocus();
    }
  }

  void selectContentAt({required int index}) {
    _setState(() {
      _selectedContent =
          _selectedContent?.id == contents[index].id ? null : contents[index];
    });
    _titleController.text = _selectedContent?.title ?? "";
    _descriptionController.text = _selectedContent?.description ?? "";
  }

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
      _bottomSheetIsOpen = false;
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (_context != null) {
      _bottomSheetIsOpen = true;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        useSafeArea: true,
        builder: (context) {
          return StatefulBuilder(
            builder: _buildPage,
          );
        },
      ).then((_) {
        onClosed?.call(contents);
      });
    }
  }

  Widget _buildPage(BuildContext context, StateSetter setState) {
    _setState = setState;
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 34,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      Wrap(
                        runSpacing: 8,
                        children: [
                          Row(
                            children: [
                              Text(
                                LocaleKeys.fieldHeadlineHint.tr(),
                                style: getHeadline2TextStyle(),
                              ),
                              const Spacer(),
                              if (contentState.isSubmitVisible)
                                LinkTextSpan(
                                  link: contentState.toName,
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      updateContent();
                                    }
                                  },
                                )
                            ],
                          ),
                          DefaultFormField(
                            hintText: LocaleKeys.fieldHeadlineHint.tr(),
                            controller: _titleController,
                            textInputAction: TextInputAction.next,
                            autofocus: contents.isEmpty,
                            focusNode: _titleFocusNode,
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
                            style: getHeadline2TextStyle(),
                          ),
                          TextAreaFormField(
                            hintText: LocaleKeys.fieldDescriptionHint.tr(),
                            minLines: 5,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            autofocus: false,
                            controller: _descriptionController,
                            onChanged: (value) {},
                            validator: SupportValidators.compose([
                              SupportValidators.required(
                                  fieldName: LocaleKeys.fieldDescription.tr()),
                              SupportValidators.inRangeLength(1, 255,
                                  fieldName: LocaleKeys.fieldDescription.tr()),
                              SupportValidators.description(
                                  fieldName: LocaleKeys.fieldDescription.tr()),
                            ]),
                          ),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: contents.length,
                        itemBuilder: (context, index) {
                          return TutorContentTile(
                            model: contents[index],
                            isSelected:
                                contents[index].id == _selectedContent?.id,
                            onTilePressed: () {
                              selectContentAt(index: index);
                            },
                            onRemovedPressed: () {
                              _setState(() {
                                contents.removeAt(index);
                              });
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  text: LocaleKeys.tutorLessonContentClose.tr(),
                  onPressed: close,
                ),
              ],
            ),
          ),
        ),
        const BottomSheetHandleBar(),
      ],
    );
  }
}

enum UpdateLessonContentState { add, update, full }

extension UpdateLessonContentStateX on UpdateLessonContentState {
  String get toName {
    switch (this) {
      case UpdateLessonContentState.add:
        return LocaleKeys.tutorLessonContentSubmit.tr();
      case UpdateLessonContentState.update:
        return LocaleKeys.tutorLessonContentUpdate.tr();
      case UpdateLessonContentState.full:
        return "";
    }
  }

  bool get isSubmitVisible => this != UpdateLessonContentState.full;
}
