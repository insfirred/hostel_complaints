// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complaint_confirmation_sheet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ComplaintConfirmationSheetState {
  DateTime get complaintDate => throw _privateConstructorUsedError;
  ComplaintType get complaintType => throw _privateConstructorUsedError;
  String get others => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // required String roomNumber,
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComplaintConfirmationSheetStateCopyWith<ComplaintConfirmationSheetState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplaintConfirmationSheetStateCopyWith<$Res> {
  factory $ComplaintConfirmationSheetStateCopyWith(
          ComplaintConfirmationSheetState value,
          $Res Function(ComplaintConfirmationSheetState) then) =
      _$ComplaintConfirmationSheetStateCopyWithImpl<$Res,
          ComplaintConfirmationSheetState>;
  @useResult
  $Res call(
      {DateTime complaintDate,
      ComplaintType complaintType,
      String others,
      String? description,
      String? errorMessage});
}

/// @nodoc
class _$ComplaintConfirmationSheetStateCopyWithImpl<$Res,
        $Val extends ComplaintConfirmationSheetState>
    implements $ComplaintConfirmationSheetStateCopyWith<$Res> {
  _$ComplaintConfirmationSheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintDate = null,
    Object? complaintType = null,
    Object? others = null,
    Object? description = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      complaintDate: null == complaintDate
          ? _value.complaintDate
          : complaintDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      complaintType: null == complaintType
          ? _value.complaintType
          : complaintType // ignore: cast_nullable_to_non_nullable
              as ComplaintType,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComplaintConsirmationSheetStateCopyWith<$Res>
    implements $ComplaintConfirmationSheetStateCopyWith<$Res> {
  factory _$$_ComplaintConsirmationSheetStateCopyWith(
          _$_ComplaintConsirmationSheetState value,
          $Res Function(_$_ComplaintConsirmationSheetState) then) =
      __$$_ComplaintConsirmationSheetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime complaintDate,
      ComplaintType complaintType,
      String others,
      String? description,
      String? errorMessage});
}

/// @nodoc
class __$$_ComplaintConsirmationSheetStateCopyWithImpl<$Res>
    extends _$ComplaintConfirmationSheetStateCopyWithImpl<$Res,
        _$_ComplaintConsirmationSheetState>
    implements _$$_ComplaintConsirmationSheetStateCopyWith<$Res> {
  __$$_ComplaintConsirmationSheetStateCopyWithImpl(
      _$_ComplaintConsirmationSheetState _value,
      $Res Function(_$_ComplaintConsirmationSheetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complaintDate = null,
    Object? complaintType = null,
    Object? others = null,
    Object? description = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ComplaintConsirmationSheetState(
      complaintDate: null == complaintDate
          ? _value.complaintDate
          : complaintDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      complaintType: null == complaintType
          ? _value.complaintType
          : complaintType // ignore: cast_nullable_to_non_nullable
              as ComplaintType,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ComplaintConsirmationSheetState
    implements _ComplaintConsirmationSheetState {
  const _$_ComplaintConsirmationSheetState(
      {required this.complaintDate,
      required this.complaintType,
      required this.others,
      required this.description,
      this.errorMessage});

  @override
  final DateTime complaintDate;
  @override
  final ComplaintType complaintType;
  @override
  final String others;
  @override
  final String? description;
// required String roomNumber,
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ComplaintConfirmationSheetState(complaintDate: $complaintDate, complaintType: $complaintType, others: $others, description: $description, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComplaintConsirmationSheetState &&
            (identical(other.complaintDate, complaintDate) ||
                other.complaintDate == complaintDate) &&
            (identical(other.complaintType, complaintType) ||
                other.complaintType == complaintType) &&
            (identical(other.others, others) || other.others == others) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, complaintDate, complaintType,
      others, description, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComplaintConsirmationSheetStateCopyWith<
          _$_ComplaintConsirmationSheetState>
      get copyWith => __$$_ComplaintConsirmationSheetStateCopyWithImpl<
          _$_ComplaintConsirmationSheetState>(this, _$identity);
}

abstract class _ComplaintConsirmationSheetState
    implements ComplaintConfirmationSheetState {
  const factory _ComplaintConsirmationSheetState(
      {required final DateTime complaintDate,
      required final ComplaintType complaintType,
      required final String others,
      required final String? description,
      final String? errorMessage}) = _$_ComplaintConsirmationSheetState;

  @override
  DateTime get complaintDate;
  @override
  ComplaintType get complaintType;
  @override
  String get others;
  @override
  String? get description;
  @override // required String roomNumber,
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ComplaintConsirmationSheetStateCopyWith<
          _$_ComplaintConsirmationSheetState>
      get copyWith => throw _privateConstructorUsedError;
}
