import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../configs/font_manager.dart';
import '../../../../configs/theme_manager.dart';
import '../../../../l10n/locale_keys.g.dart';

enum BookingStatusEnum {
  booked,
  notBooked;
}

extension BookingStatusEnumX on BookingStatusEnum {
  String get name {
    switch (this) {
      case BookingStatusEnum.booked:
        return LocaleKeys.bookindStatus0.tr();
      case BookingStatusEnum.notBooked:
        return LocaleKeys.bookindStatus1.tr();
    }
  }

  String get code {
    switch (this) {
      case BookingStatusEnum.booked:
        return "1";
      case BookingStatusEnum.notBooked:
        return "0";
    }
  }
}

class TutorHomeRadioFormField extends StatefulWidget {
  const TutorHomeRadioFormField({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialValue,
  });

  final List<String> items;
  final Function(int index) onChanged;
  final String? initialValue;

  @override
  State<TutorHomeRadioFormField> createState() =>
      _TutorHomeRadioFormFieldState();
}

class _TutorHomeRadioFormFieldState extends State<TutorHomeRadioFormField> {
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.items.indexWhere((element) => element == widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.bookingPickerTitle.tr(),
          style: getHeadline2TextStyle(),
        ),
        const SizedBox(height: 8.0),
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
                widget.onChanged(index);
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
