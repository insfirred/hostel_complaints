import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/enums/enums.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String name;
  final String mobile;
  @JsonKey(name: 'room_number')
  final int? roomNumber;
  @JsonKey(name: 'dormitory_number')
  final int? dormitoryNumber;
  final String floor;
  @JsonKey(name: 'stay_type')
  final String stayType;

  const UserData({
    required this.name,
    required this.mobile,
    this.roomNumber,
    this.dormitoryNumber,
    required this.floor,
    required this.stayType,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
