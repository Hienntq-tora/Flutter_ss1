import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/forms/text_area_form_field.dart';
import 'package:time_tracker/ui/validations/support_validator.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    super.key,
    this.controller,
    required this.onTap,
    required this.title,
    required this.isSelected,
    required this.emptyIcon,
    required this.selectedIcon,
  });

  final TextEditingController? controller;
  final VoidCallback onTap;
  final bool isSelected;
  final String title;
  final Widget emptyIcon;
  final Widget selectedIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          const Divider(height: 0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: getBody1TextStyle(),
                  ),
                ),
                isSelected ? selectedIcon : emptyIcon,
              ],
            ),
          ),
          if (controller != null && isSelected)
            Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 0, bottom: 16),
              width: double.infinity,
              child: TextAreaFormField(
                controller: controller,
                keyboardType: TextInputType.multiline,
                hintText: LocaleKeys.reportTextLabel.tr(),
                maxLength: 200,
                maxLines: 5,
                minLines: 5,
                onChanged: (value) {},
                validator: SupportValidators.compose(
                  [
                    SupportValidators.required(
                      fieldName: LocaleKeys.reportValidate2.tr(),
                    ),
                    SupportValidators.name(
                      fieldName: LocaleKeys.reportValidate3.tr(),
                    ),
                  ],
                ),
              ),
            ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
