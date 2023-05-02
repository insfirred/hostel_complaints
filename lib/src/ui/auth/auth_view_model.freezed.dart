// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthViewState {
  AuthScreen get screen => throw _privateConstructorUsedError;
  AuthViewStatus get status => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  int? get forceResendingToken => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthViewStateCopyWith<AuthViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewStateCopyWith<$Res> {
  factory $AuthViewStateCopyWith(
          AuthViewState value, $Res Function(AuthViewState) then) =
      _$AuthViewStateCopyWithImpl<$Res, AuthViewState>;
  @useResult
  $Res call(
      {AuthScreen screen,
      AuthViewStatus status,
      String mobile,
      String otp,
      bool isLogin,
      String? verificationId,
      int? forceResendingToken,
      String? error});
}

/// @nodoc
class _$AuthViewStateCopyWithImpl<$Res, $Val extends AuthViewState>
    implements $AuthViewStateCopyWith<$Res> {
  _$AuthViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
    Object? status = null,
    Object? mobile = null,
    Object? otp = null,
    Object? isLogin = null,
    Object? verificationId = freezed,
    Object? forceResendingToken = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as AuthScreen,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthViewStatus,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthViewStateCopyWith<$Res>
    implements $AuthViewStateCopyWith<$Res> {
  factory _$$_AuthViewStateCopyWith(
          _$_AuthViewState value, $Res Function(_$_AuthViewState) then) =
      __$$_AuthViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthScreen screen,
      AuthViewStatus status,
      String mobile,
      String otp,
      bool isLogin,
      String? verificationId,
      int? forceResendingToken,
      String? error});
}

/// @nodoc
class __$$_AuthViewStateCopyWithImpl<$Res>
    extends _$AuthViewStateCopyWithImpl<$Res, _$_AuthViewState>
    implements _$$_AuthViewStateCopyWith<$Res> {
  __$$_AuthViewStateCopyWithImpl(
      _$_AuthViewState _value, $Res Function(_$_AuthViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screen = null,
    Object? status = null,
    Object? mobile = null,
    Object? otp = null,
    Object? isLogin = null,
    Object? verificationId = freezed,
    Object? forceResendingToken = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_AuthViewState(
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as AuthScreen,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthViewStatus,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      forceResendingToken: freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthViewState with DiagnosticableTreeMixin implements _AuthViewState {
  const _$_AuthViewState(
      {this.screen = AuthScreen.login,
      this.status = AuthViewStatus.initial,
      this.mobile = '',
      this.otp = '',
      this.isLogin = true,
      this.verificationId,
      this.forceResendingToken,
      this.error});

  @override
  @JsonKey()
  final AuthScreen screen;
  @override
  @JsonKey()
  final AuthViewStatus status;
  @override
  @JsonKey()
  final String mobile;
  @override
  @JsonKey()
  final String otp;
  @override
  @JsonKey()
  final bool isLogin;
  @override
  final String? verificationId;
  @override
  final int? forceResendingToken;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthViewState(screen: $screen, status: $status, mobile: $mobile, otp: $otp, isLogin: $isLogin, verificationId: $verificationId, forceResendingToken: $forceResendingToken, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthViewState'))
      ..add(DiagnosticsProperty('screen', screen))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('isLogin', isLogin))
      ..add(DiagnosticsProperty('verificationId', verificationId))
      ..add(DiagnosticsProperty('forceResendingToken', forceResendingToken))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthViewState &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, screen, status, mobile, otp,
      isLogin, verificationId, forceResendingToken, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthViewStateCopyWith<_$_AuthViewState> get copyWith =>
      __$$_AuthViewStateCopyWithImpl<_$_AuthViewState>(this, _$identity);
}

abstract class _AuthViewState implements AuthViewState {
  const factory _AuthViewState(
      {final AuthScreen screen,
      final AuthViewStatus status,
      final String mobile,
      final String otp,
      final bool isLogin,
      final String? verificationId,
      final int? forceResendingToken,
      final String? error}) = _$_AuthViewState;

  @override
  AuthScreen get screen;
  @override
  AuthViewStatus get status;
  @override
  String get mobile;
  @override
  String get otp;
  @override
  bool get isLogin;
  @override
  String? get verificationId;
  @override
  int? get forceResendingToken;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_AuthViewStateCopyWith<_$_AuthViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
