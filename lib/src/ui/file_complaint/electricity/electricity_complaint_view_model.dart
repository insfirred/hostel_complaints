// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/services/firebase_auth.dart';
import '../../../logic/services/firestore.dart';
import '../../../models/firestore_models.dart/complaint_data.dart';
import '../../home/home_view_model.dart';

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
  }) : super(ElectricityComplaintViewState(complaintDate: DateTime.now())) {
    _fetchComplaints();
  }

  fileComplaintSlided() async {
    await _validation();

    if (state.status == ElectricityComplaintViewStatus.noError) {
      final currentComplaintData = ComplaintData(
        roomNumber: ref.read(homeViewModelProvider).userData!.roomNumber!,
        date: state.complaintDate,
        complaintType: state.selectedComplaintType.toString().substring(25),
        others: state.others,
        description: state.description,
      );

      List<ComplaintData> tempList = [];
      for (ComplaintData complaint in state.selectedRoomComplaintsList) {
        tempList.add(complaint);
      }

      await _isSelectedComplaintTypeAlreadyExistInFirestore(tempList);

      if (state.status == ElectricityComplaintViewStatus.noError) {
        // adds the current complaint data in complaints list.
        tempList.add(currentComplaintData);

        // sets updated list in state
        _updateComplaintsList(tempList);

        await firebaseFirestore
            .collection('electricity_complaints')
            .doc(
                ref.read(homeViewModelProvider).userData!.roomNumber.toString())
            .set(
          {
            'complaints': state.selectedRoomComplaintsList
                .map((complaint) => complaint.toJson())
                .toList(),
          },
        );
      }
    }
  }

  setComplaintType(int index) => state = state.copyWith(
        selectedComplaintType: ElectricityComplaintType.values[index],
        status: ElectricityComplaintViewStatus.noError,
      );

  setOthers(String text) => state = state.copyWith(
        others: text,
        status: ElectricityComplaintViewStatus.noError,
      );

  setDescription(String text) => state = state.copyWith(
        description: text,
        status: ElectricityComplaintViewStatus.noError,
      );

  _updateComplaintsList(List<ComplaintData> list) => state = state.copyWith(
        selectedRoomComplaintsList: list,
      );

  /// It validates complaint type and others field.
  _validation() {
    if (state.selectedComplaintType == null) {
      _setError('Select your complaint type');
    }
    if (state.selectedComplaintType == ElectricityComplaintType.Others &&
        (state.others == null || state.others!.isEmpty)) {
      _setError('Enter your other field');
    }
  }

  /// It fetchs users room all complaints list.
  _fetchComplaints() async {
    List<dynamic>? complaintsList;
    try {
      await firebaseFirestore
          .collection('electricity_complaints')
          .doc(ref.read(homeViewModelProvider).userData!.roomNumber.toString())
          .get()
          .then(
        (snapshot) {
          List<dynamic>? tempComplaintsList = snapshot.data()?['complaints'];
          complaintsList = tempComplaintsList;
        },
      );
    } catch (e) {
      _setError('Something went wrong');
      debugPrint(e.toString());
    }

    if (complaintsList == null) {
      state = state.copyWith(selectedRoomComplaintsList: []);
    } else {
      state = state.copyWith(
        selectedRoomComplaintsList: complaintsList!.map(
          (complaint) {
            return ComplaintData.fromJson(complaint);
          },
        ).toList(),
      );
    }
  }

  /// checks if selected complaint type complaint already exists or not.
  _isSelectedComplaintTypeAlreadyExistInFirestore(
    List<ComplaintData> list,
  ) {
    for (ComplaintData complaint in list) {
      if (state.status == ElectricityComplaintViewStatus.error) break;
      if (complaint.complaintType ==
              state.selectedComplaintType.toString().substring(25) &&
          complaint.complaintType != 'Others') {
        _setError(
          'The complaint for ${complaint.complaintType} is already pending,',
        );
      }
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
    @Default([]) List<ComplaintData> selectedRoomComplaintsList,
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
