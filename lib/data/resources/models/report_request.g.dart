// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lessonId', 'reportType', 'description'],
  );
  return ReportRequest(
    json['lessonId'] as String?,
    json['reportType'] as String,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$ReportRequestToJson(ReportRequest instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'reportType': instance.reportType,
      'description': instance.description,
    };
