import 'package:freezed_annotation/freezed_annotation.dart';

part 'complaint_data.g.dart';

@JsonSerializable()
class ComplaintData {
  @JsonKey(name: 'room_number')
  final int roomNumber;
  final String date;
  @JsonKey(name: 'complaint_type')
  final String complaintType;
  final String? others;
  final String? description;
  @JsonKey(name: 'is_complaint_fulfilled')
  final bool? isComplaintFulfilled;

  const ComplaintData({
    required this.roomNumber,
    required this.date,
    required this.complaintType,
    this.others,
    this.description,
    this.isComplaintFulfilled = false,
  });

  factory ComplaintData.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDataFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintDataToJson(this);
}