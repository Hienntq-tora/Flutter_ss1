class GetLessonsInput {
  const GetLessonsInput({
    this.filter,
    this.tutorId,
    this.search,
    this.fieldId,
    this.difficult,
  });

  final int? filter;
  final String? tutorId;
  final String? search;
  final String? fieldId;
  final String? difficult;
}
