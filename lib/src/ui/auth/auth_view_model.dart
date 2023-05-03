import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/services/firebase_auth.dart';
import 'package:hostel_complaints/src/ui/create_user/create_user_view_model.dart';

import '../../constants/constants.dart';

part 'auth_view_model.freezed.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthViewState>(
  (ref) => AuthViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    ref: ref,
  ),
);

class AuthViewModel extends StateNotifier<AuthViewState> {
  final FirebaseAuth firebaseAuth;
  final AutoDisposeStateNotifierProviderRef ref;
  AuthViewModel({
    required this.firebaseAuth,
    required this.ref,
  }) : super(const AuthViewState());

  /// returns whether back navigation should be triggered or not
  bool onBackPressed() {
    if (state.screen == AuthScreen.otp) {
      state = state.copyWith(
        screen: state.isLogin ? AuthScreen.login : AuthScreen.register,
      );
      return false;
    }
    return true;
  }

  /// validates the phone number
  /// makes an API call and check if this user exists or not
  /// and requests OTP using Firebase Auth
  requestOtp() async {
    debugPrint('requestOtp() called...');
    if (state.mobile.trim().isEmpty) {
      _setError('Please enter the phone number.');
      return;
    }
    if (state.mobile.trim().length != 10) {
      _setError('Invalid phone number!');
      return;
    }

    // TODO: Chack if user already existed or not and show corresponding error.
    // final apiResponse =
    //     await apiService.checkIfUserExists('+91${state.mobile}');
    // // if user is logging in, and account doesn't exist, show an error
    // if (state.isLogin && apiResponse.status != ApiStatus.success) {
    //   _setError(
    //       'No account exists with this number! Please sign up to create an account.');
    // }
    // // if user is signing up, but account already exists, show an error
    // else if (!state.isLogin && apiResponse.status == ApiStatus.success) {
    //   _setError('Account already exists! Please login in to continue.');
    // }
    // // else, request for OTP, and let the user continue
    // else {
    //   state = state.copyWith(
    //     status: AuthPageStatus.processingRequestOtp,
    //   );
    //   _verifyPhoneNumber();
    // }
    state = state.copyWith(
      status: AuthViewStatus.processingRequestOtp,
    );
    _verifyPhoneNumber();
  }

  /// verifies the OTP when auto-verification doesn't work
  /// and user manually enters the OTP
  /// (validates OTP length before verification)
  /// upon successful verification, signs in the user
  verifyOtp() async {
    if (state.otp.isEmpty) {
      _setError('Please enter the OTP!');
      return;
    }
    if (state.otp.length != 6) {
      _setError('Invalid OTP entered.');
      return;
    }
    if (state.verificationId == null) {
      _setError('Please request the OTP again!');
      return;
    }
    state = state.copyWith(
      status: AuthViewStatus.processingVerifyOtp,
    );
    try {
      await firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: state.verificationId!,
          smsCode: state.otp,
        ),
      );
      _setMobileInCreateViewModel();
      debugPrint('user signed succesfully manually.....');
    } catch (e) {
      debugPrint(e.toString());
      _setError('Invalid OTP entered.');
    }
  }

  setAuthScreen(AuthScreen screen) {
    state = state.copyWith(screen: screen);

    /// below logic is for handling [onBackPressed] functionality.
    if (screen == AuthScreen.login) {
      state = state.copyWith(isLogin: true);
    } else if (screen == AuthScreen.register) {
      state = state.copyWith(isLogin: false);
    }
  }

  setMobile(String mobile) => state = state.copyWith(
        mobile: mobile,
      );

  setOtp(String otp) => state = state.copyWith(
        otp: otp,
      );

  _verifyPhoneNumber({bool forceResend = false}) async {
    try {
      firebaseAuth.verifyPhoneNumber(
        timeout: otpTimeout,
        phoneNumber: '+91${state.mobile}',
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: (e) {
          debugPrint(e.toString());
          _setError(e.message);
        },
        codeSent: (verificationId, forceResendingToken) {
          debugPrint(
              'verificationId: $verificationId \nsforceResendingToken: $forceResendingToken');
          state = state.copyWith(
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
            screen: AuthScreen.otp,
            status: AuthViewStatus.initial,
          );
        },
        codeAutoRetrievalTimeout: (_) {
          debugPrint('codeAutoRetrievalTimeout: $_');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      _setError(null);
    }
  }

  /// called when automatic OTP verification is completed
  /// signs in the user using [credential]
  _onVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      await firebaseAuth.signInWithCredential(credential);
      _setMobileInCreateViewModel();
      debugPrint('user signed succesfully automatically...');
    } catch (e) {
      debugPrint(e.toString());
      _setError('Unable to sign in!');
    }
  }

  _setError(String? errorMessage) => state = state.copyWith(
        status: AuthViewStatus.error,
        error: errorMessage,
      );

  _setMobileInCreateViewModel() =>
      ref.read(createUserViewModelProvider.notifier).setMobile(state.mobile);
}

@freezed
class AuthViewState with _$AuthViewState {
  const factory AuthViewState({
    @Default(AuthScreen.login) AuthScreen screen,
    @Default(AuthViewStatus.initial) AuthViewStatus status,
    @Default('') String mobile,
    @Default('') String otp,
    @Default(true) bool isLogin,
    String? verificationId,
    int? forceResendingToken,
    String? error,
  }) = _AuthViewState;
}

enum AuthViewStatus {
  initial,
  processingRequestOtp,
  processingResendOtp,
  processingVerifyOtp,
  error,
}

enum AuthScreen {
  login,
  register,
  otp,
}
