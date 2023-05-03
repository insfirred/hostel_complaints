// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomData _$RoomDataFromJson(Map<String, dynamic> json) => RoomData(
      roomNumber: json['room_number'] as int,
      firstMemberId: json['first_member_id'] as String?,
      firstMemberName: json['first_member_name'] as String?,
      secondMemberId: json['second_member_id'] as String?,
      secondMemberName: json['second_member_name'] as String?,
      thirdMemberId: json['third_member_id'] as String?,
      thirdMemberName: json['third_member_name'] as String?,
    );

Map<String, dynamic> _$RoomDataToJson(RoomData instance) => <String, dynamic>{
      'room_number': instance.roomNumber,
      'first_member_id': instance.firstMemberId,
      'first_member_name': instance.firstMemberName,
      'second_member_id': instance.secondMemberId,
      'second_member_name': instance.secondMemberName,
      'third_member_id': instance.thirdMemberId,
      'third_member_name': instance.thirdMemberName,
    };
