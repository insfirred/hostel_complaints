import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/services/firestore.dart';
import 'package:hostel_complaints/src/ui/auth/auth_view_model.dart';

import '../../constants/constants.dart';
import '../services/firebase_auth.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  // ignore: unused_field
  late final StreamSubscription _subscription;
  final StateNotifierProviderRef ref;

  AppRepository({
    required this.firebaseAuth,
    required this.firestore,
    required this.ref,
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
    }();
  }

  setAppStatus(AppStatus status) => state = state.copyWith(
        appStatus: status,
      );

  /// fetches user data from server & sets the state
  _fetchUserDataAndSetState(User? user) async {
    ref.read(authViewModelProvider).mobile;
    final userId = user?.uid;
    debugPrint('userId present in firestore: $userId');
    if (userId == null) {
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
      //   debugPrint('Error while fetching user data');
      //   debugPrint(response.toString());
      // }

      await _checkIfUserDataExists(userId);
      if (!state.userDataExists) {
        state = state.copyWith(
          authUser: user,
          appStatus: AppStatus.authenticatedWithNoUserData,
        );
        debugPrint('user data is missing in firestore');
      } else {
        state = state.copyWith(
          authUser: user,
          appStatus: AppStatus.authenticatedWithUserData,
        );
        debugPrint('user data exist in firestore');
      }
    }
  }

  Future<void> _checkIfUserDataExists(String userId) async {
    await firestore.collection('users').doc(userId).get().then(
      (value) {
        debugPrint(value.data().toString());
        if (value.data() != null) {
          state = state.copyWith(userDataExists: true);
        }
      },
    );
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    @Default(false) bool userDataExists,
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
