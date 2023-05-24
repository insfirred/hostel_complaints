import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/services/firebase_auth.dart';
import '../../../logic/services/firestore.dart';
import '../../../models/firestore_models.dart/complaint_data.dart';
import '../../home/home_view_model.dart';

part 'electricity_complaints_list_view_model.freezed.dart';

final electricityComplaintsListViewModelProvider =
    StateNotifierProvider.autoDispose<ELectricityComplaintsListViewModel,
        ElectricityComplaintsListViewState>(
  (ref) => ELectricityComplaintsListViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class ELectricityComplaintsListViewModel
    extends StateNotifier<ElectricityComplaintsListViewState> {
  final FirebaseAuth firebaseAuth;
  final AutoDisposeStateNotifierProviderRef ref;
  final FirebaseFirestore firestore;

  ELectricityComplaintsListViewModel({
    required this.firebaseAuth,
    required this.ref,
    required this.firestore,
  }) : super(const ElectricityComplaintsListViewState()) {
    _fetchComplaintsDataFromFirestore();
  }

  _fetchComplaintsDataFromFirestore() async {
    try {
      state =
          state.copyWith(status: ElectricityComplaintsListViewStatus.loading);
      // fetching all complaints from firestore
      List<dynamic> allComplaintsJsonList = await firestore
          .collection('electricity_complaints')
          .doc(ref.read(homeViewModelProvider).userData!.roomNumber.toString())
          .get()
          .then((snapshot) => snapshot.data()?['complaints'] as List<dynamic>);

      // converting all complaints into ComplaintData objects
      List<ComplaintData> allComplaints = allComplaintsJsonList
          .map((complain) => ComplaintData.fromJson(complain))
          .toList();

      // sorting the complaint in desecding order based on their dates
      allComplaints.sort((a, b) => b.date.compareTo(a.date));

      // extracting pending complaints from all complaints
      List<ComplaintData> pendingComplaints = [];
      for (ComplaintData complaint in allComplaints) {
        if (complaint.isComplaintFulfilled == false) {
          pendingComplaints.add(complaint);
        }
      }

      // setting the list into state
      state = state.copyWith(
        allComplaints: allComplaints,
        pendingComplaints: pendingComplaints,
        status: ElectricityComplaintsListViewStatus.loaded,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

@freezed
class ElectricityComplaintsListViewState
    with _$ElectricityComplaintsListViewState {
  const factory ElectricityComplaintsListViewState({
    @Default([]) List<ComplaintData> allComplaints,
    @Default([]) List<ComplaintData> pendingComplaints,
    @Default(ElectricityComplaintsListViewStatus.loading)
        ElectricityComplaintsListViewStatus status,
    String? error,
  }) = _ElectricityComplaintsListViewState;
}

enum ElectricityComplaintsListViewStatus {
  loading,
  loaded,
  error,
}
