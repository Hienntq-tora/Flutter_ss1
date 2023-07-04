class TimeSlot {
  static List<String> hours = List.generate(25, (index) => "$index");

  static List<String> minutes = ["00", "30"];

  static List<String> timeList = hours
      .map((hour) => minutes.map((minute) => "$hour:$minute"))
      .expand((e) => e)
      .where((timeSlot) => timeSlot != "24:30")
      .toList();

  static List<TimeSlotModel> timeSlotList =
      Iterable<int>.generate(timeList.length - 1).map((index) {
    return TimeSlotModel(
        index + 1, "${timeList[index]} - ${timeList[index + 1]}");
  }).toList();
}

class TimeSlotModel {
  TimeSlotModel(this.timeId, this.timeString);

  final int timeId;
  final String timeString;
}
