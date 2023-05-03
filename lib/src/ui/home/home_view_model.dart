import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/repositories/app_repository.dart';
import 'package:hostel_complaints/src/logic/services/firebase_auth.dart';
import 'package:hostel_complaints/src/logic/services/firestore.dart';

import '../../models/firestore_models.dart/user_data.dart';

part 'home_view_model.freezed.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class HomeViewModel extends StateNotifier<HomeViewState> {
  final FirebaseAuth firebaseAuth;
  final AutoDisposeStateNotifierProviderRef ref;
  final FirebaseFirestore firestore;

  HomeViewModel({
    required this.firebaseAuth,
    required this.ref,
    required this.firestore,
  }) : super(const HomeViewState()) {
    _fetchUserDataFromFirestore();
  }

  _fetchUserDataFromFirestore() async {
    _generateGreetingMessage();
    state = state.copyWith(status: HomeViewStatus.loading);
    var userDataMap = await firestore
        .collection('users')
        .doc(ref.read(appRepositoryProvider).authUser?.uid)
        .get()
        .then((value) => value.data());

    UserData userData = UserData.fromJson(userDataMap!);
    state = state.copyWith(userData: userData);
    state = state.copyWith(status: HomeViewStatus.loaded);
  }

  /// sets the [greetingMessage] according to the current hour.
  _generateGreetingMessage() {
    DateTime now = DateTime.now();
    if (now.hour >= 5 && now.hour <= 11) {
      state = state.copyWith(greetingMessage: 'Good Morning');
    } else if (now.hour >= 12 && now.hour <= 16) {
      state = state.copyWith(greetingMessage: 'Good Afternoon');
    } else {
      state = state.copyWith(greetingMessage: 'Good Evening');
    }
  }
}

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    UserData? userData,
    String? greetingMessage,
    @Default(HomeViewStatus.loading) HomeViewStatus status,
    String? error,
  }) = _HomeViewState;
}

enum HomeViewStatus {
  loading,
  loaded,
  error,
}
