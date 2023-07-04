import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/configs/font_manager.dart';
import 'package:time_tracker/domain/entities/field.dart';
import 'package:time_tracker/domain/enums/date_formats.dart';
import 'package:time_tracker/l10n/locale_keys.g.dart';
import 'package:time_tracker/ui/components/bottom_sheet_handle_bar.dart';
import 'package:time_tracker/ui/components/buttons/button.dart';
import 'package:time_tracker/ui/components/buttons/secondary_button.dart';
import 'package:time_tracker/ui/components/forms/default_form_field.dart';
import 'package:time_tracker/ui/components/forms/dropdown_filter_form_field.dart';
import 'package:time_tracker/ui/screens/tutor_home/component/tutor_home_radio_form_field.dart';
import 'package:time_tracker/utils/util.dart';

class FilterAppointmentModel {
  FilterAppointmentModel({
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.bookingStatus,
  });

  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  BookingStatusEnum? bookingStatus;
}

class FilterAppointmentBottomSheet {
  FilterAppointmentBottomSheet({
    this.onFilterSuccess,
    required DateTime? startDate,
    required DateTime? endDate,
    required this.startTime,
    required this.endTime,
    required this.items,
    required this.showRadioList,
    required this.bookingStatus,
  }) {
    _startDateController.text =
        startDate.parseToString(DateFormats.filterDate) ?? "";
    _endDateController.text =
        endDate.parseToString(DateFormats.filterDate) ?? "";
  }

  bool _bottomSheetIsOpen = false;
  late BuildContext? _context;

  final bool showRadioList;
  final List<Field> items;
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  Field? startTime;
  Field? endTime;
  BookingStatusEnum? bookingStatus;
  final Function(FilterAppointmentModel params)? onFilterSuccess;

  void _applyFilter() {
    onFilterSuccess?.call(FilterAppointmentModel(
      startDate: _startDateController.text.parseToDate(DateFormats.filterDate),
      endDate: _endDateController.text.parseToDate(DateFormats.filterDate),
      startTime: startTime?.name,
      endTime: endTime?.name,
      bookingStatus: bookingStatus,
    ));
    close();
  }

  void _selectDate(BuildContext context,
      {required TextEditingController controller}) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (pickedDate != null) {
      controller.text = pickedDate.parseToString(DateFormats.filterDate) ?? "";
    }
  }

  void close() {
    if (_bottomSheetIsOpen && _context != null) {
      Navigator.pop(_context!);
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
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return _buildPage(context, setState);
            },
          );
        },
      );
    }
    return Future.value(false);
  }

  Widget _buildPage(BuildContext context, StateSetter setState) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BottomSheetHandleBar(),
                Text(
                  LocaleKeys.tutorFilterAppointmentHeader1.tr(),
                  style: getHeadline1TextStyle(),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: DefaultFormField(
                        hintText: LocaleKeys.tutorFilterAppointmentHint1.tr(),
                        onChanged: (value) => {},
                        validator: (value) => null,
                        spacing: 0,
                        padding: const EdgeInsets.only(left: 16, right: 5),
                        autofocus: false,
                        controller: _startDateController,
                        onTap: () {
                          _selectDate(context,
                              controller: _startDateController);
                        },
                        readOnly: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear_rounded,
                          ),
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          onPressed: () {
                            _startDateController.clear();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: DefaultFormField(
                        hintText: LocaleKeys.tutorFilterAppointmentHint2.tr(),
                        onChanged: (value) => {},
                        validator: (value) => null,
                        spacing: 0,
                        padding: const EdgeInsets.only(left: 16, right: 5),
                        autofocus: false,
                        controller: _endDateController,
                        onTap: () async {
                          _selectDate(context, controller: _endDateController);
                        },
                        readOnly: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          padding: EdgeInsets.zero,
                          iconSize: 20,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          onPressed: () {
                            _endDateController.clear();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  LocaleKeys.tutorFilterAppointmentHeader2.tr(),
                  style: getHeadline1TextStyle(),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: DropdownFilterFormField(
                        items: items,
                        hint: LocaleKeys.tutorFilterAppointmentHint3.tr(),
                        defaultSelectedValue: startTime,
                        onChanged: (selectedValue) => startTime = selectedValue,
                        validator: (value) => null,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: DropdownFilterFormField(
                        items: items,
                        hint: LocaleKeys.tutorFilterAppointmentHint4.tr(),
                        defaultSelectedValue: endTime,
                        onChanged: (selectedValue) => endTime = selectedValue,
                        validator: (value) => null,
                      ),
                    ),
                  ],
                ),
                if (showRadioList)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TutorHomeRadioFormField(
                      key: UniqueKey(),
                      items:
                          BookingStatusEnum.values.map((e) => e.name).toList(),
                      onChanged: (index) =>
                          bookingStatus = BookingStatusEnum.values[index],
                      initialValue: bookingStatus?.name,
                    ),
                  ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        text: LocaleKeys.tutorFilterAppointmentSubmit.tr(),
                        onPressed: _applyFilter,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: SecondaryButton(
                        text: LocaleKeys.tutorFilterAppointmentReset.tr(),
                        fillColor: Theme.of(context).colorScheme.error,
                        onPressed: () {
                          setState(() {
                            _startDateController.clear();
                            _endDateController.clear();
                            startTime = null;
                            endTime = null;
                            bookingStatus = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
