// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldDto _$FieldDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['_id', 'fieldName'],
  );
  return FieldDto(
    id: json['_id'] as String,
    name: json['fieldName'] as String,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$FieldDtoToJson(FieldDto instance) => <String, dynamic>{
      '_id': instance.id,
      'fieldName': instance.name,
      'description': instance.description,
    };
