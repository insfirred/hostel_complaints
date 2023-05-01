import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/constants.dart';
import '../services/firebase_auth.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;

  AppRepository({
    required this.firebaseAuth,
  }) : super(const AppState()) {
    () async {
      await Future.delayed(spalshScreenDuration);
      state = state.copyWith(
        appStatus: AppStatus.unauthenticated,
      );
    }();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    @Default(AppStatus.initial) AppStatus? appStatus,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticatedWithNoUserData,
  authenticatedButNoInternetConnection,
  authenticatedWithUserData,
}
