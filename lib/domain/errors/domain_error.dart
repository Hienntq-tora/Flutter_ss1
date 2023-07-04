import '../../data/resources/api_enum.dart';

abstract class DomainError {
  final String message;
  final ApiEnum? api;

  const DomainError({this.message = '', this.api});
}
