import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_data.g.dart';

@JsonSerializable()
class RoomData {
  @JsonKey(name: 'room_number')
  final int roomNumber;
  @JsonKey(name: 'first_member_id')
  final String? firstMemberId;
  @JsonKey(name: 'first_member_name')
  final String? firstMemberName;
  @JsonKey(name: 'second_member_id')
  final String? secondMemberId;
  @JsonKey(name: 'second_member_name')
  final String? secondMemberName;
  @JsonKey(name: 'third_member_id')
  final String? thirdMemberId;
  @JsonKey(name: 'third_member_name')
  final String? thirdMemberName;

  RoomData({
    required this.roomNumber,
    this.firstMemberId,
    this.firstMemberName,
    this.secondMemberId,
    this.secondMemberName,
    this.thirdMemberId,
    this.thirdMemberName,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) =>
      _$RoomDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDataToJson(this);
}
