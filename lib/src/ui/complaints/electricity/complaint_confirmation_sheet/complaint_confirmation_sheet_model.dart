// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../electricity_complaint_view_model.dart';

part 'complaint_confirmation_sheet_model.freezed.dart';

final complaintConfirmationSheetModelProvider =
    StateNotifierProvider.autoDispose<ComplaintConfirmationSheetModel,
        ComplaintConfirmationSheetState>(
  (ref) => ComplaintConfirmationSheetModel(
    // apiService: ref.read(apiServiceProvider),
    ref: ref,
  ),
);

class ComplaintConfirmationSheetModel
    extends StateNotifier<ComplaintConfirmationSheetState> {
  // ApiService apiService;
  final AutoDisposeStateNotifierProviderRef ref;

  ComplaintConfirmationSheetModel({
    // required this.apiService,
    required this.ref,
  }) : super(
          ComplaintConfirmationSheetState(
            complaintDate: DateTime.now(),
            complaintType: ref
                .read(electricityComplaintViewModelProvider)
                .selectedComplaintType!,
            description:
                ref.read(electricityComplaintViewModelProvider).description,
            others: ref.read(electricityComplaintViewModelProvider).others!,
            // roomNumber: ref.read(mainPageModelProvider).roomNumber!,
          ),
        );
}

@freezed
class ComplaintConfirmationSheetState with _$ComplaintConfirmationSheetState {
  const factory ComplaintConfirmationSheetState({
    required DateTime complaintDate,
    required ComplaintType complaintType,
    required String others,
    required String? description,
    // required String roomNumber,
    String? errorMessage,
  }) = _ComplaintConsirmationSheetState;
}
