import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_tracker/configs/icon_manager.dart';

import '../../../configs/font_manager.dart';

class SearchFormField extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final Function()? onEditingComplete;
  final Function()? onTapTrailing;
  final GlobalKey trailingButtonKey;
  final FormFieldValidator<String> validator;
  final String? initialValue;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction textInputAction;
  final bool displaySuffixIcon;

  const SearchFormField({
    Key? key,
    required this.onChanged,
    required this.onEditingComplete,
    required this.onTapTrailing,
    required this.trailingButtonKey,
    required this.validator,
    this.displaySuffixIcon = true,
    this.initialValue,
    this.nextFocusNode,
    this.focusNode,
    this.controller,
    this.hintText,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (_) => nextFocusNode?.requestFocus(),
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autofocus: false,
      controller: controller,
      style: getBody2TextStyle(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(top: 16, right: 30),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 20),
          child: SvgPicture.asset(
            IconManager.search,
            colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white,
                BlendMode.srcIn),
          ),
        ),
        suffixIcon: displaySuffixIcon
            ? Padding(
                padding: const EdgeInsets.only(left: 15, right: 8),
                child: InkWell(
                  key: trailingButtonKey,
                  onTap: onTapTrailing,
                  child: SvgPicture.asset(
                    IconManager.sort,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyMedium?.color ??
                            Colors.white,
                        BlendMode.srcIn),
                  ),
                ),
              )
            : null,
        hintText: hintText ?? 'Search',
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
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
        ),
      ),
    );
  }
}
