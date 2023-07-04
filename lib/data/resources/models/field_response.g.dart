// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldResponse _$FieldResponseFromJson(Map<String, dynamic> json) =>
    FieldResponse(
      sId: json['_id'] as String?,
      fieldName: json['fieldName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$FieldResponseToJson(FieldResponse instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'fieldName': instance.fieldName,
      'description': instance.description,
    };
