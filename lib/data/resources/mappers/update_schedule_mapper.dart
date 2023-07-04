import 'package:time_tracker/data/resources/models/get_schedule_list_request.dart';
import 'package:time_tracker/domain/entities/get_schedule_list_input.dart';
import 'package:time_tracker/domain/entities/update_reservable_date_input.dart';

import '../models/update_reservable_date_request.dart';

extension GetScheduleListRequestX on GetScheduleListInput {
  GetScheduleListRequest toDto() {
    return GetScheduleListRequest(dateTime, dateTime);
  }
}

extension UpdateReservableDateRequestX on UpdateReservableDateInput {
  UpdateReservableDateRequest toDto() {
    return UpdateReservableDateRequest(
      dateTime,
      "[${timeIds.join(", ")}]",
    );
  }
}
