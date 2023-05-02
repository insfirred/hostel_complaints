// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/services/firebase_auth.dart';

part 'electricity_complaint_view_model.freezed.dart';

final electricityComplaintViewModelProvider = StateNotifierProvider.autoDispose<
    ElectricityComplaintViewModel, ElectricityComplaintViewState>(
  (ref) => ElectricityComplaintViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    // firebaseFirestore: ref.watch(firestoreProvider),
    // apiService: ref.read(apiServiceProvider),
    ref: ref,
  ),
);

class ElectricityComplaintViewModel
    extends StateNotifier<ElectricityComplaintViewState> {
  final FirebaseAuth firebaseAuth;
  // final FirebaseFirestore firebaseFirestore;
  // ApiService apiService;
  final AutoDisposeStateNotifierProviderRef ref;

  ElectricityComplaintViewModel({
    required this.firebaseAuth,
    // required this.firebaseFirestore,
    // required this.apiService,
    required this.ref,
  }) : super(ElectricityComplaintViewState(complaintDate: DateTime.now()));

  setComplaintType(int index) => state = state.copyWith(
        selectedComplaintType: ComplaintType.values[index],
      );

  setOthers(String text) => state = state.copyWith(
        others: text,
      );

  setDescription(String text) => state = state.copyWith(
        description: text,
      );
}

@freezed
class ElectricityComplaintViewState with _$ElectricityComplaintViewState {
  const factory ElectricityComplaintViewState({
    required DateTime complaintDate,
    ComplaintType? selectedComplaintType,
    String? others,
    String? description,
    String? errorMessage,
  }) = _ElectricityComplaintViewState;
}

enum ComplaintType {
  Tubelight,
  Fan,
  Switch,
  Socket,
  MCB,
  Others,
}
