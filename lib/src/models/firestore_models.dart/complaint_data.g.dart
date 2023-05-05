// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintData _$ComplaintDataFromJson(Map<String, dynamic> json) =>
    ComplaintData(
      roomNumber: json['room_number'] as int,
      date: timestampToDateTime(json['date'] as Timestamp?),
      complaintType: json['complaint_type'] as String,
      others: json['others'] as String?,
      description: json['description'] as String?,
      isComplaintFulfilled: json['is_complaint_fulfilled'] as bool? ?? false,
    );

Map<String, dynamic> _$ComplaintDataToJson(ComplaintData instance) =>
    <String, dynamic>{
      'room_number': instance.roomNumber,
      'date': dateTimeToTimestamp(instance.date),
      'complaint_type': instance.complaintType,
      'others': instance.others,
      'description': instance.description,
      'is_complaint_fulfilled': instance.isComplaintFulfilled,
    };
