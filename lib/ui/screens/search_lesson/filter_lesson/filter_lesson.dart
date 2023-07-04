import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/forms/dropdown_filter_form_field.dart';

class FilterLessonBottomSheet {
  FilterLessonBottomSheet(
      {required this.onFilterSuccess,
      required this.items,
      this.selectedField,
      this.selectedLevel});

  final Function(String fieldId, String difficulty) onFilterSuccess;
  final List<Field> items;
  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;
  Field? selectedField;
  String? selectedLevel;

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
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const BottomSheetHandleBar(),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Wrap(
                          runSpacing: 14,
                          children: [
                            Text(
                              LocaleKeys.fieldTitle.tr(),
                              style: getHeadline2TextStyle(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownFilterFormField(
                                items: items,
                                hint: "Field",
                                onChanged: (value) {
                                  selectedField = value;
                                },
                                defaultSelectedValue: selectedField,
                                validator: (value) {
                                  return "";
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: OptionSelectFormField(
                          items: const ["Beginner", "Intermediate", "Advanced"],
                          onChanged: (value) {
                            selectedLevel = value;
                          },
                          value: selectedLevel,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Button(
                                text: LocaleKeys.applyTextButton.tr(),
                                onPressed: () {
                                  close();
                                  onFilterSuccess.call(selectedField?.id ?? "",
                                      selectedLevel ?? "");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 54),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void dispose() {
    _context = null;
  }
}

class OptionSelectFormField extends StatefulWidget {
  const OptionSelectFormField(
      {super.key, required this.items, required this.onChanged, this.value});

  final List<String> items;
  final Function(String) onChanged;
  final String? value;

  @override
  State<OptionSelectFormField> createState() => _OptionSelectFormFieldState();
}

class _OptionSelectFormFieldState extends State<OptionSelectFormField> {
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.items.indexWhere((element) => element == widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 14,
      children: [
        Text(
          LocaleKeys.lessonLevelTitle.tr(),
          style: getHeadline2TextStyle(),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.items.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 0,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onChanged(widget.items[index]);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.items[index],
                      style: getBody2TextStyle(),
                    ),
                    if (_selectedIndex == index)
                      SizedBox(
                        child: Icon(
                          Icons.check_circle,
                          color: GeneralColors.primaryColor,
                        ),
                      )
                    else
                      SizedBox(
                        child: Icon(
                          Icons.circle_outlined,
                          color: GeneralColors.primaryColor,
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
