import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/services/firebase_auth.dart';

part 'auth_view_model.freezed.dart';

final authViewModelProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthViewState>(
  (ref) => AuthViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthViewState> {
  final FirebaseAuth firebaseAuth;
  AuthViewModel({
    required this.firebaseAuth,
  }) : super(const AuthViewState());

  setAuthScreen(AuthScreen screen) => state = state.copyWith(
        screen: screen,
      );
  setMobile(String mobile) => state = state.copyWith(
        mobile: mobile,
      );
}

@freezed
class AuthViewState with _$AuthViewState {
  const factory AuthViewState({
    @Default(AuthScreen.login) AuthScreen screen,
    @Default('') String mobile,
  }) = _AuthViewState;
}

enum AuthScreen {
  login,
  register,
  otp,
}
