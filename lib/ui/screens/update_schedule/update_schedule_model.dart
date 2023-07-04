import 'package:flutter/material.dart';
import 'package:time_tracker/ui/screens/filter_appointment/filter_appointment/filter_time_slots.dart';

enum UpdateScheduleStatusEnum {
  initial,
  selected,
  booked;
}

class UpdateScheduleModel {
  UpdateScheduleModel({
    required this.timeSlot,
    this.isReservated = false,
    this.isSelected = false,
  });

  final TimeSlotModel timeSlot;

  bool isReservated;
  bool isSelected;

  UpdateScheduleStatusEnum get status {
    if (isReservated) return UpdateScheduleStatusEnum.booked;
    return (isSelected)
        ? UpdateScheduleStatusEnum.selected
        : UpdateScheduleStatusEnum.initial;
  }

  void toggleSelection() => isSelected = !isSelected;
}

extension UpdateScheduleModelX on UpdateScheduleModel {
  Color? fillColor(ThemeData theme) {
    switch (status) {
      case UpdateScheduleStatusEnum.initial:
        return null;
      case UpdateScheduleStatusEnum.selected:
        return theme.disabledColor;
      case UpdateScheduleStatusEnum.booked:
        return theme.primaryColor;
    }
  }

  Color? borderColor(ThemeData theme) {
    switch (status) {
      case UpdateScheduleStatusEnum.initial:
        return theme.primaryColor;
      case UpdateScheduleStatusEnum.selected:
      case UpdateScheduleStatusEnum.booked:
        return Colors.transparent;
    }
  }

  Color? textColor(ThemeData theme) {
    switch (status) {
      case UpdateScheduleStatusEnum.initial:
        return theme.textTheme.bodyMedium?.color;
      case UpdateScheduleStatusEnum.selected:
      case UpdateScheduleStatusEnum.booked:
        return theme.scaffoldBackgroundColor;
    }
  }

  UpdateScheduleModel copyWith({
    TimeSlotModel? timeSlot,
    bool? isReservated,
    bool? isSelected,
  }) {
    return UpdateScheduleModel(
      timeSlot: timeSlot ?? this.timeSlot,
      isReservated: isReservated ?? this.isReservated,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
