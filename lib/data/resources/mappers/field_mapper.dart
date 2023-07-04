import 'package:time_tracker/data/resources/models/field_dto.dart';

import '../../../domain/entities/field.dart';

extension FieldDtoX on FieldDto {
  Field toEntity() {
    return Field(id: id, name: name, description: description);
  }
}
