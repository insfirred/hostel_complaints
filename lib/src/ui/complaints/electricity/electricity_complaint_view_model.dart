// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/services/firestore.dart';
import 'package:hostel_complaints/src/ui/home/home_view_model.dart';

import '../../../logic/services/firebase_auth.dart';

part 'electricity_complaint_view_model.freezed.dart';

final electricityComplaintViewModelProvider = StateNotifierProvider.autoDispose<
    ElectricityComplaintViewModel, ElectricityComplaintViewState>(
  (ref) => ElectricityComplaintViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class ElectricityComplaintViewModel
    extends StateNotifier<ElectricityComplaintViewState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  final AutoDisposeStateNotifierProviderRef ref;

  ElectricityComplaintViewModel({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.ref,
  }) : super(ElectricityComplaintViewState(complaintDate: DateTime.now()));

  setComplaintType(int index) => state = state.copyWith(
        selectedComplaintType: ElectricityComplaintType.values[index],
      );

  setOthers(String text) => state = state.copyWith(
        others: text,
      );

  setDescription(String text) => state = state.copyWith(
        description: text,
      );

  fileComplaintSlided() {
    _validation();
    if (state.status == ElectricityComplaintViewStatus.noError) {
      // TODO: Set complaint data in firestore
      // firebaseFirestore
      //     .collection('complaints')
      //     .doc(ref.read(homeViewModelProvider).userData!.roomNumber.toString())
      //     .set(data);
    }
  }

  _validation() {
    if (state.selectedComplaintType == null) {
      _setError('Select your complaint type');
    }
    if (state.selectedComplaintType == ElectricityComplaintType.Others &&
        (state.others == null || state.others!.isEmpty)) {
      _setError('Enter your other field');
    }
  }

  _setError(String error) {
    state = state.copyWith(
      status: ElectricityComplaintViewStatus.error,
      errorMessage: error,
    );
  }
}

@freezed
class ElectricityComplaintViewState with _$ElectricityComplaintViewState {
  const factory ElectricityComplaintViewState({
    required DateTime complaintDate,
    ElectricityComplaintType? selectedComplaintType,
    String? others,
    String? description,
    @Default(ElectricityComplaintViewStatus.noError)
        ElectricityComplaintViewStatus status,
    String? errorMessage,
  }) = _ElectricityComplaintViewState;
}

enum ElectricityComplaintType {
  Tubelight,
  Fan,
  Switch,
  Socket,
  MCB,
  Others,
}

enum ElectricityComplaintViewStatus {
  noError,
  error,
}
