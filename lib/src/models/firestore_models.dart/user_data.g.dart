// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      roomNumber: json['room_number'] as int?,
      dormitoryNumber: json['dormitory_number'] as int?,
      floor: json['floor'] as String,
      stayType: json['stay_type'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'room_number': instance.roomNumber,
      'dormitory_number': instance.dormitoryNumber,
      'floor': instance.floor,
      'stay_type': instance.stayType,
    };
