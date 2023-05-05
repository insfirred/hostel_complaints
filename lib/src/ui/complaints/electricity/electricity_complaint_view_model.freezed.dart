// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity_complaint_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ElectricityComplaintViewState {
  DateTime get complaintDate => throw _privateConstructorUsedError;
  ElectricityComplaintType? get selectedComplaintType =>
      throw _privateConstructorUsedError;
  String? get others => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ElectricityComplaintViewStatus get status =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ElectricityComplaintViewStateCopyWith<ElectricityComplaintViewState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityComplaintViewStateCopyWith<$Res> {
  factory $ElectricityComplaintViewStateCopyWith(
          ElectricityComplaintViewState value,
          $Res Function(ElectricityComplaintViewState) then) =
      _$ElectricityComplaintViewStateCopyWithImpl<$Res,
          ElectricityComplaintViewState>;
  @useResult
  $Res call(
      {DateTime complaintDate,
      ElectricityComplaintType? selectedComplaintType,
      String? others,
      String? description,
      ElectricityComplaintViewStatus status,
      String? errorMessage});
}

/// @nodoc
class _$ElectricityComplaintViewStateCopyWithImpl<$Res,
        $Val extends ElectricityComplaintViewState>
    implements $ElectricityComplaintViewStateCopyWith<$Res> {
  _$ElectricityComplaintViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintDate = null,
    Object? selectedComplaintType = freezed,
    Object? others = freezed,
    Object? description = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      complaintDate: null == complaintDate
          ? _value.complaintDate
          : complaintDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedComplaintType: freezed == selectedComplaintType
          ? _value.selectedComplaintType
          : selectedComplaintType // ignore: cast_nullable_to_non_nullable
              as ElectricityComplaintType?,
      others: freezed == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ElectricityComplaintViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElectricityComplaintViewStateCopyWith<$Res>
    implements $ElectricityComplaintViewStateCopyWith<$Res> {
  factory _$$_ElectricityComplaintViewStateCopyWith(
          _$_ElectricityComplaintViewState value,
          $Res Function(_$_ElectricityComplaintViewState) then) =
      __$$_ElectricityComplaintViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime complaintDate,
      ElectricityComplaintType? selectedComplaintType,
      String? others,
      String? description,
      ElectricityComplaintViewStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$_ElectricityComplaintViewStateCopyWithImpl<$Res>
    extends _$ElectricityComplaintViewStateCopyWithImpl<$Res,
        _$_ElectricityComplaintViewState>
    implements _$$_ElectricityComplaintViewStateCopyWith<$Res> {
  __$$_ElectricityComplaintViewStateCopyWithImpl(
      _$_ElectricityComplaintViewState _value,
      $Res Function(_$_ElectricityComplaintViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintDate = null,
    Object? selectedComplaintType = freezed,
    Object? others = freezed,
    Object? description = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ElectricityComplaintViewState(
      complaintDate: null == complaintDate
          ? _value.complaintDate
          : complaintDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedComplaintType: freezed == selectedComplaintType
          ? _value.selectedComplaintType
          : selectedComplaintType // ignore: cast_nullable_to_non_nullable
              as ElectricityComplaintType?,
      others: freezed == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ElectricityComplaintViewStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ElectricityComplaintViewState
    implements _ElectricityComplaintViewState {
  const _$_ElectricityComplaintViewState(
      {required this.complaintDate,
      this.selectedComplaintType,
      this.others,
      this.description,
      this.status = ElectricityComplaintViewStatus.noError,
      this.errorMessage});

  @override
  final DateTime complaintDate;
  @override
  final ElectricityComplaintType? selectedComplaintType;
  @override
  final String? others;
  @override
  final String? description;
  @override
  @JsonKey()
  final ElectricityComplaintViewStatus status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ElectricityComplaintViewState(complaintDate: $complaintDate, selectedComplaintType: $selectedComplaintType, others: $others, description: $description, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElectricityComplaintViewState &&
            (identical(other.complaintDate, complaintDate) ||
                other.complaintDate == complaintDate) &&
            (identical(other.selectedComplaintType, selectedComplaintType) ||
                other.selectedComplaintType == selectedComplaintType) &&
            (identical(other.others, others) || other.others == others) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, complaintDate,
      selectedComplaintType, others, description, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElectricityComplaintViewStateCopyWith<_$_ElectricityComplaintViewState>
      get copyWith => __$$_ElectricityComplaintViewStateCopyWithImpl<
          _$_ElectricityComplaintViewState>(this, _$identity);
}

abstract class _ElectricityComplaintViewState
    implements ElectricityComplaintViewState {
  const factory _ElectricityComplaintViewState(
      {required final DateTime complaintDate,
      final ElectricityComplaintType? selectedComplaintType,
      final String? others,
      final String? description,
      final ElectricityComplaintViewStatus status,
      final String? errorMessage}) = _$_ElectricityComplaintViewState;

  @override
  DateTime get complaintDate;
  @override
  ElectricityComplaintType? get selectedComplaintType;
  @override
  String? get others;
  @override
  String? get description;
  @override
  ElectricityComplaintViewStatus get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ElectricityComplaintViewStateCopyWith<_$_ElectricityComplaintViewState>
      get copyWith => throw _privateConstructorUsedError;
}
