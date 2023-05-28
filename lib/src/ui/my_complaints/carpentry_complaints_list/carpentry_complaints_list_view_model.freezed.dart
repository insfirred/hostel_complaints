// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carpentry_complaints_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarpentryComplaintsListViewState {
  List<ComplaintData> get allComplaints => throw _privateConstructorUsedError;
  List<ComplaintData> get pendingComplaints =>
      throw _privateConstructorUsedError;
  CarpentryComplaintsListViewStatus get status =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarpentryComplaintsListViewStateCopyWith<CarpentryComplaintsListViewState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpentryComplaintsListViewStateCopyWith<$Res> {
  factory $CarpentryComplaintsListViewStateCopyWith(
          CarpentryComplaintsListViewState value,
          $Res Function(CarpentryComplaintsListViewState) then) =
      _$CarpentryComplaintsListViewStateCopyWithImpl<$Res,
          CarpentryComplaintsListViewState>;
  @useResult
  $Res call(
      {List<ComplaintData> allComplaints,
      List<ComplaintData> pendingComplaints,
      CarpentryComplaintsListViewStatus status,
      String? error});
}

/// @nodoc
class _$CarpentryComplaintsListViewStateCopyWithImpl<$Res,
        $Val extends CarpentryComplaintsListViewState>
    implements $CarpentryComplaintsListViewStateCopyWith<$Res> {
  _$CarpentryComplaintsListViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allComplaints = null,
    Object? pendingComplaints = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      allComplaints: null == allComplaints
          ? _value.allComplaints
          : allComplaints // ignore: cast_nullable_to_non_nullable
              as List<ComplaintData>,
      pendingComplaints: null == pendingComplaints
          ? _value.pendingComplaints
          : pendingComplaints // ignore: cast_nullable_to_non_nullable
              as List<ComplaintData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CarpentryComplaintsListViewStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarpentryComplaintsListViewStateCopyWith<$Res>
    implements $CarpentryComplaintsListViewStateCopyWith<$Res> {
  factory _$$_CarpentryComplaintsListViewStateCopyWith(
          _$_CarpentryComplaintsListViewState value,
          $Res Function(_$_CarpentryComplaintsListViewState) then) =
      __$$_CarpentryComplaintsListViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ComplaintData> allComplaints,
      List<ComplaintData> pendingComplaints,
      CarpentryComplaintsListViewStatus status,
      String? error});
}

/// @nodoc
class __$$_CarpentryComplaintsListViewStateCopyWithImpl<$Res>
    extends _$CarpentryComplaintsListViewStateCopyWithImpl<$Res,
        _$_CarpentryComplaintsListViewState>
    implements _$$_CarpentryComplaintsListViewStateCopyWith<$Res> {
  __$$_CarpentryComplaintsListViewStateCopyWithImpl(
      _$_CarpentryComplaintsListViewState _value,
      $Res Function(_$_CarpentryComplaintsListViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allComplaints = null,
    Object? pendingComplaints = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_CarpentryComplaintsListViewState(
      allComplaints: null == allComplaints
          ? _value._allComplaints
          : allComplaints // ignore: cast_nullable_to_non_nullable
              as List<ComplaintData>,
      pendingComplaints: null == pendingComplaints
          ? _value._pendingComplaints
          : pendingComplaints // ignore: cast_nullable_to_non_nullable
              as List<ComplaintData>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CarpentryComplaintsListViewStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CarpentryComplaintsListViewState
    with DiagnosticableTreeMixin
    implements _CarpentryComplaintsListViewState {
  const _$_CarpentryComplaintsListViewState(
      {final List<ComplaintData> allComplaints = const [],
      final List<ComplaintData> pendingComplaints = const [],
      this.status = CarpentryComplaintsListViewStatus.loading,
      this.error})
      : _allComplaints = allComplaints,
        _pendingComplaints = pendingComplaints;

  final List<ComplaintData> _allComplaints;
  @override
  @JsonKey()
  List<ComplaintData> get allComplaints {
    if (_allComplaints is EqualUnmodifiableListView) return _allComplaints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allComplaints);
  }

  final List<ComplaintData> _pendingComplaints;
  @override
  @JsonKey()
  List<ComplaintData> get pendingComplaints {
    if (_pendingComplaints is EqualUnmodifiableListView)
      return _pendingComplaints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingComplaints);
  }

  @override
  @JsonKey()
  final CarpentryComplaintsListViewStatus status;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CarpentryComplaintsListViewState(allComplaints: $allComplaints, pendingComplaints: $pendingComplaints, status: $status, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CarpentryComplaintsListViewState'))
      ..add(DiagnosticsProperty('allComplaints', allComplaints))
      ..add(DiagnosticsProperty('pendingComplaints', pendingComplaints))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarpentryComplaintsListViewState &&
            const DeepCollectionEquality()
                .equals(other._allComplaints, _allComplaints) &&
            const DeepCollectionEquality()
                .equals(other._pendingComplaints, _pendingComplaints) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allComplaints),
      const DeepCollectionEquality().hash(_pendingComplaints),
      status,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarpentryComplaintsListViewStateCopyWith<
          _$_CarpentryComplaintsListViewState>
      get copyWith => __$$_CarpentryComplaintsListViewStateCopyWithImpl<
          _$_CarpentryComplaintsListViewState>(this, _$identity);
}

abstract class _CarpentryComplaintsListViewState
    implements CarpentryComplaintsListViewState {
  const factory _CarpentryComplaintsListViewState(
      {final List<ComplaintData> allComplaints,
      final List<ComplaintData> pendingComplaints,
      final CarpentryComplaintsListViewStatus status,
      final String? error}) = _$_CarpentryComplaintsListViewState;

  @override
  List<ComplaintData> get allComplaints;
  @override
  List<ComplaintData> get pendingComplaints;
  @override
  CarpentryComplaintsListViewStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_CarpentryComplaintsListViewStateCopyWith<
          _$_CarpentryComplaintsListViewState>
      get copyWith => throw _privateConstructorUsedError;
}
