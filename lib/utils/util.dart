import 'package:easy_localization/easy_localization.dart';
import 'package:time_tracker/constants/constant.dart';

extension StringX on String? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  String orEmpty() {
    if (this == null) return "";
    return this!;
  }

  bool get isValidImageLink => !isEmptyOrNull && this != noImageUrl;

  DateTime? parseToDate(String format) {
    if (isEmptyOrNull) return null;
    return DateFormat(format).parse(this!);
  }
}

extension DateTimeX on DateTime {
  String? getDayOfMonthSuffix() {
    if (!(day >= 1 && day <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

extension OptionalDateTimeX on DateTime? {
  String? parseToString(String format) {
    if (this == null) return null;
    return DateFormat(format).format(this!);
  }
}

extension OptionalListX on List? {
  bool get isEmptyOrNull => this == null || (this?.isEmpty ?? true);
}

extension IntX on int? {
  bool get isValidIndex => this != null && this != -1;
}
