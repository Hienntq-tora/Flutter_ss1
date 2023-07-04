class ReservableDate {
  ReservableDate({
    this.id,
    this.tutor,
    this.timeId,
    this.datetime,
    this.timeString,
    this.isReservated,
  });

  final String? id;
  final String? tutor;
  final int? timeId;
  final String? datetime;
  final String? timeString;
  final bool? isReservated;
}
