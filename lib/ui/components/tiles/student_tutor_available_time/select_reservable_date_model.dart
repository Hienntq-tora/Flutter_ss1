import 'package:flutter/material.dart';
import 'package:time_tracker/configs/icon_manager.dart';

class ReservableDateGroupModel {
  ReservableDateGroupModel({
    required this.date,
    required this.itemList,
  });

  final String? date;
  List<ReservableDateItemModel> itemList;
}

class ReservableDateItemModel {
  ReservableDateItemModel({
    this.id,
    this.timeSlot,
  });

  final String? id;
  final String? timeSlot;
}

enum TutorAvailableTimeTileState {
  initial,
  selected,
}

extension TutorAvailableTimeTileStateX on TutorAvailableTimeTileState {
  String get assetIcon {
    switch (this) {
      case TutorAvailableTimeTileState.initial:
        return IconManager.tickEmpty;
      case TutorAvailableTimeTileState.selected:
        return IconManager.tickFilled;
    }
  }

  Color fillColor(BuildContext context) {
    switch (this) {
      case TutorAvailableTimeTileState.initial:
        return Theme.of(context).dialogBackgroundColor;
      case TutorAvailableTimeTileState.selected:
        return Theme.of(context).highlightColor;
    }
  }
}
