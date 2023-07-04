import 'package:time_tracker/data/resources/models/get_reservable_date_request.dart';
import 'package:time_tracker/data/resources/models/reservable_date_dto.dart';
import 'package:time_tracker/domain/entities/get_reservable_date_input.dart';
import 'package:time_tracker/domain/entities/reservable_date.dart';

extension ReservableDateDtoX on ReservableDateDto {
  ReservableDate toEntity() {
    return ReservableDate(
      id: id,
      tutor: tutor,
      timeId: timeId,
      datetime: datetime,
      timeString: timeString,
      isReservated: isReservated,
    );
  }
}

extension ReservableDateDtoListX on List<ReservableDateDto> {
  List<ReservableDate> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}

extension GetReservableDateRequestX on GetReservableDateInput {
  GetReservableDateRequest toDto() {
    return GetReservableDateRequest(tutorId);
  }
}
