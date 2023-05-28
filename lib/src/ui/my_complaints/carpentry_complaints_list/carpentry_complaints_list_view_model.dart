import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logic/services/firebase_auth.dart';
import '../../../logic/services/firestore.dart';
import '../../../models/firestore_models.dart/complaint_data.dart';
import '../../home/home_view_model.dart';

part 'carpentry_complaints_list_view_model.freezed.dart';

final capentryComplaintsListViewModelProvider =
    StateNotifierProvider.autoDispose<CarpentryComplaintsListViewModel,
        CarpentryComplaintsListViewState>(
  (ref) => CarpentryComplaintsListViewModel(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    ref: ref,
  ),
);

class CarpentryComplaintsListViewModel
    extends StateNotifier<CarpentryComplaintsListViewState> {
  final FirebaseAuth firebaseAuth;
  final AutoDisposeStateNotifierProviderRef ref;
  final FirebaseFirestore firestore;

  CarpentryComplaintsListViewModel({
    required this.firebaseAuth,
    required this.ref,
    required this.firestore,
  }) : super(const CarpentryComplaintsListViewState()) {
    _fetchComplaintsDataFromFirestore();
  }

  _fetchComplaintsDataFromFirestore() async {
    try {
      state = state.copyWith(status: CarpentryComplaintsListViewStatus.loading);
      // fetching all complaints from firestore
      List<dynamic> allComplaintsJsonList = await firestore
          .collection('carpentry_complaints')
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
        status: CarpentryComplaintsListViewStatus.loaded,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

@freezed
class CarpentryComplaintsListViewState with _$CarpentryComplaintsListViewState {
  const factory CarpentryComplaintsListViewState({
    @Default([]) List<ComplaintData> allComplaints,
    @Default([]) List<ComplaintData> pendingComplaints,
    @Default(CarpentryComplaintsListViewStatus.loading)
        CarpentryComplaintsListViewStatus status,
    String? error,
  }) = _CarpentryComplaintsListViewState;
}

enum CarpentryComplaintsListViewStatus {
  loading,
  loaded,
  error,
}
