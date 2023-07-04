import 'package:flutter/material.dart';
import 'package:time_tracker/configs/theme_manager.dart';
import 'package:time_tracker/domain/entities/field.dart';

import '../../../configs/font_manager.dart';

class DropdownFilterFormField extends StatelessWidget {
  const DropdownFilterFormField({
    Key? key,
    required this.items,
    required this.hint,
    required this.validator,
    this.onChanged,
    this.defaultSelectedValue,
    this.nextFocusNode,
    this.focusNode,
  }) : super(key: key);

  final Iterable<Field> items;
  final String hint;
  final ValueChanged<Field?>? onChanged;
  final FormFieldValidator<Field> validator;
  final Field? defaultSelectedValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((Field value) {
        return DropdownMenuItem<Field>(
          value: value,
          child: Text(
            value.name,
            textAlign: TextAlign.center,
            style: getBody2TextStyle(),
          ),
        );
      }).toList(),
      value: defaultSelectedValue,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintStyle: getBody2TextStyle(),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFEFF1F3), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: GeneralColors.errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: GeneralColors.errorColor, width: 1),
        ),
      ),
    );
  }
}
