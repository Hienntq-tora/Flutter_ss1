class ReportModel {
  ReportModel({
    required this.title,
    required this.reportType,
    this.isChecked = false,
  });

  final String title;
  final int reportType;
  bool isChecked;
}
