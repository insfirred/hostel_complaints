import 'dart:async';

import 'package:flutter/foundation.dart';
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
  late final StreamSubscription _subscription;

  AppRepository({
    required this.firebaseAuth,
  }) : super(const AppState()) {
    () async {
      await Future.delayed(spalshScreenDuration);
      _subscription = firebaseAuth.authStateChanges().listen(
        (user) async {
          if (user == null) {
            state = state.copyWith(
              appStatus: AppStatus.unauthenticated,
            );
          } else {
            // save user auth data in state
            state = state.copyWith(authUser: user);
            // fetch user's data from server & set state accordingly
            _fetchUserDataAndSetState(user);
          }
        },
      );
      // state = state.copyWith(
      //   appStatus: AppStatus.unauthenticated,
      // );
    }();
  }

  /// fetches user data from server & sets the state
  _fetchUserDataAndSetState(User? user) async {
    final idToken = await user?.getIdToken();
    debugPrint(idToken);
    if (idToken == null) {
      state = state.copyWith(
        appStatus: AppStatus.unauthenticated,
      );
    } else {
      // final response = await apiService.getUserData(
      //   authToken: await user?.getIdToken() ?? '',
      // );
      // if (response.status == ApiStatus.success) {
      //   state = state.copyWith(
      //     authUser: user,
      //     userData: response.data!,
      //     status: AppStatus.authenticatedWithUserData,
      //   );
      // } else if (response.errorMessage == 'User not found!') {
      //   // user is authenticated, but user data is not present
      //   state = state.copyWith(
      //     authUser: user,
      //     status: AppStatus.authenticatedWithNoUserData,
      //   );
      // } else if (response.errorMessage == noInternetErrorString) {
      //   // user is authenticated, but couldn't fetch user data as there's no internet connection
      //   state = state.copyWith(
      //     authUser: user,
      //     status: AppStatus.authenticatedButNoInternetConnection,
      //   );
      // } else {
      //   // handle any other error here
      //   // TODO: handle error
      //   debugPrint('Error while fetching user data');
      //   debugPrint(response.toString());
      // }
      state = state.copyWith(
        authUser: user,
        appStatus: AppStatus.authenticatedWithUserData,
      );
      debugPrint('user phone number: ${user?.phoneNumber}');
    }
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
