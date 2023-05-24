// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/logic/services/firebase_auth.dart';
import 'package:hostel_complaints/src/ui/home/home_view_model.dart';
import '../../../logic/services/firestore.dart';
import '../../../models/firestore_models.dart/complaint_data.dart';
part 'carpentry_complaint_view_model.freezed.dart';

final carpentryComplaintViewModelprovider = StateNotifierProvider.autoDispose<
    CarpentryComplaintViewModel, CarpentryComplaintViewModelState>(
  (ref) => CarpentryComplaintViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class CarpentryComplaintViewModel
    extends StateNotifier<CarpentryComplaintViewModelState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final AutoDisposeStateNotifierProviderRef ref;
  CarpentryComplaintViewModel({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.ref,
  }) : super(CarpentryComplaintViewModelState(complaintDate: DateTime.now())) {
    _fetchComplaints();
  }

  fileComplaintSlided() async {
    await _validation();

    if (state.status == CarpentryComplaintViewStatus.noError) {
      final currentComplaintData = ComplaintData(
        roomNumber: ref.read(homeViewModelProvider).userData!.roomNumber!,
        date: state.complaintDate,
        complaintType: state.selectedComplaintType.toString().substring(23),
        others: state.others,
        description: state.description,
      );

      List<ComplaintData> tempList = [];
      for (ComplaintData complaint in state.selectedRoomComplaintsList) {
        tempList.add(complaint);
      }

      await _isSelectedComplaintTypeAlreadyExistInFirestore(tempList);

      if (state.status == CarpentryComplaintViewStatus.noError) {
        // adds the current complaint data in complaints list.
        tempList.add(currentComplaintData);

        // sets updated list in state
        _updateComplaintsList(tempList);

        await firebaseFirestore
            .collection('carpentry_complaints')
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
        selectedComplaintType: CarpentryComplaintType.values[index],
        status: CarpentryComplaintViewStatus.noError,
      );

  setOthers(String text) => state = state.copyWith(
      others: text, status: CarpentryComplaintViewStatus.noError);

  setDescription(String text) => state = state.copyWith(
      description: text, status: CarpentryComplaintViewStatus.noError);

  _updateComplaintsList(List<ComplaintData> list) => state = state.copyWith(
        selectedRoomComplaintsList: list,
      );

  _validation() {
    if (state.selectedComplaintType == null) {
      _setError("Select your complaint type");
    }
    if (state.selectedComplaintType == CarpentryComplaintType.Others &&
        (state.others == null || state.others!.isEmpty)) {
      _setError('Enter your other field');
    }
  }

  _isSelectedComplaintTypeAlreadyExistInFirestore(
    List<ComplaintData> list,
  ) {
    for (ComplaintData complaint in list) {
      if (state.status == CarpentryComplaintViewStatus.error) break;
      if (complaint.complaintType ==
              state.selectedComplaintType.toString().substring(23) &&
          complaint.complaintType != 'Others') {
        _setError(
          'The complaint for ${complaint.complaintType} is already pending,',
        );
      }
    }
  }

  _fetchComplaints() async {
    List<dynamic>? complaintsList;
    try {
      await firebaseFirestore
          .collection('carpentry_complaints')
          .doc(ref.read(homeViewModelProvider).userData!.roomNumber.toString())
          .get()
          .then((snapshot) {
        List<dynamic>? tempComplaintsList = snapshot.data()?['complaints'];
        complaintsList = tempComplaintsList;
      });
    } catch (e) {
      _setError('Something went wrong');
      // print(e);
    }

    if (complaintsList == null) {
      state = state.copyWith(selectedRoomComplaintsList: []);
    } else {
      state = state.copyWith(
        selectedRoomComplaintsList: complaintsList!.map((complaint) {
          return ComplaintData.fromJson(complaint);
        }).toList(),
      );
    }
  }

  _setError(String error) {
    state = state.copyWith(
      status: CarpentryComplaintViewStatus.error,
      errorMessage: error,
    );
  }
}

@freezed
class CarpentryComplaintViewModelState with _$CarpentryComplaintViewModelState {
  const factory CarpentryComplaintViewModelState({
    required DateTime complaintDate,
    CarpentryComplaintType? selectedComplaintType,
    String? others,
    String? description,
    @Default([]) List<ComplaintData> selectedRoomComplaintsList,
    @Default(CarpentryComplaintViewStatus.noError)
    CarpentryComplaintViewStatus status,
    String? errorMessage,
  }) = _CarpentryComplaintViewModelState;
}

enum CarpentryComplaintType {
  Door,
  Table,
  Others,
}

enum CarpentryComplaintViewStatus {
  noError,
  error,
}
