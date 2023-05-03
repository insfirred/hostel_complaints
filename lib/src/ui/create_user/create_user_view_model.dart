// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_complaints/src/models/firestore_models.dart/room_data.dart';

// 🌎 Project imports:
import '../../enums/enums.dart';
import '../../logic/repositories/app_repository.dart';
import '../../logic/services/firestore.dart';
import '../../models/firestore_models.dart/user_data.dart';

part 'create_user_view_model.freezed.dart';

final createUserViewModelProvider =
    StateNotifierProvider<CreateUserViewModel, CreateUserViewState>(
  (ref) => CreateUserViewModel(
    firebaseFirestore: ref.watch(firestoreProvider),
    // userId: ref.read(appRepositoryProvider).authUser?.uid ?? '',
    ref: ref,
  ),
);

class CreateUserViewModel extends StateNotifier<CreateUserViewState> {
  final FirebaseFirestore firebaseFirestore;
  // final String userId;
  final StateNotifierProviderRef ref;

  CreateUserViewModel({
    required this.firebaseFirestore,
    // required this.userId,
    required this.ref,
  }) : super(const CreateUserViewState());

  onSubmitPressed() async {
    if (state.username.length >= 3) {
      _setUserDataInFirestore();
      _setUserRoomDataInFirestore();
      if (state.status == CreateUserPageStatus.noError) {
        ref
            .read(appRepositoryProvider.notifier)
            .setAppStatus(AppStatus.authenticatedWithUserData);
      }
    } else {
      _setError('Name should be at least of 3 characters');
    }
  }

  setName(String name) => state = state.copyWith(
        username: name,
        status: CreateUserPageStatus.noError,
      );
  setMobile(String mobile) => state = state.copyWith(
        mobile: mobile,
        status: CreateUserPageStatus.noError,
      );
  setStayType(StayType type) => state = state.copyWith(
        selectedStaytype: type,
        status: CreateUserPageStatus.noError,
      );
  setFloor(Floor floor) => state = state.copyWith(
        selectedFloor: floor,
        status: CreateUserPageStatus.noError,
      );
  setRoomNumber(dynamic roomNumber) => state = state.copyWith(
        selectedRoomNumber: roomNumber,
        status: CreateUserPageStatus.noError,
      );
  setDormitoryNumber(Dormitory dormitoryNumber) => state = state.copyWith(
        selectedDormitoryNumber: dormitoryNumber,
        status: CreateUserPageStatus.noError,
      );

  /// sets the user's data in users collection in firestore
  _setUserDataInFirestore() async {
    await firebaseFirestore
        .collection('users')
        .doc(ref.read(appRepositoryProvider).authUser?.uid)
        .set(
          UserData(
            name: state.username,
            mobile: state.mobile,
            roomNumber: state.selectedStaytype == StayType.Room
                ? int.tryParse(
                      state.selectedRoomNumber.toString().substring(8),
                    ) ??
                    -1
                : null,
            dormitoryNumber: state.selectedStaytype == StayType.Dormitory
                ? int.tryParse(
                      state.selectedDormitoryNumber.toString().substring(11),
                    ) ??
                    -1
                : null,
            floor: state.selectedFloor.name,
            stayType: state.selectedStaytype.name,
          ).toJson(),
          SetOptions(merge: true),
        );
  }

  _setUserRoomDataInFirestore() async {
    Map<String, dynamic>? selectedRoomData = await firebaseFirestore
        .collection('rooms')
        .doc(state.selectedRoomNumber.toString().substring(8))
        .get()
        .then((_) => _.data());

    if (selectedRoomData == null) {
      debugPrint('first member....');
      // for first member
      await firebaseFirestore
          .collection('rooms')
          .doc(state.selectedRoomNumber.toString().substring(8))
          .set(
            RoomData(
              roomNumber: int.tryParse(
                      state.selectedRoomNumber.toString().substring(8)) ??
                  -1,
              firstMemberId: ref.read(appRepositoryProvider).authUser?.uid,
              firstMemberName: state.username,
            ).toJson(),
          );
    } else {
      if (selectedRoomData['second_member_id'] == null) {
        // for second member
        debugPrint('second member....');
        await firebaseFirestore
            .collection('rooms')
            .doc(state.selectedRoomNumber.toString().substring(8))
            .set(
              RoomData(
                roomNumber: int.tryParse(
                        state.selectedRoomNumber.toString().substring(8)) ??
                    -1,
                firstMemberId: selectedRoomData['first_member_id'],
                firstMemberName: selectedRoomData['first_member_name'],
                secondMemberId: ref.read(appRepositoryProvider).authUser?.uid,
                secondMemberName: state.username,
              ).toJson(),
              SetOptions(merge: true),
            );
      } else if (selectedRoomData['third_member_id'] == null) {
        // for third member
        debugPrint('third member....');
        await firebaseFirestore
            .collection('rooms')
            .doc(state.selectedRoomNumber.toString().substring(8))
            .set(
              RoomData(
                roomNumber: int.tryParse(
                        state.selectedRoomNumber.toString().substring(8)) ??
                    -1,
                firstMemberId: selectedRoomData['first_member_id'],
                firstMemberName: selectedRoomData['first_member_name'],
                secondMemberId: selectedRoomData['second_member_id'],
                secondMemberName: selectedRoomData['second_member_name'],
                thirdMemberId: ref.read(appRepositoryProvider).authUser?.uid,
                thirdMemberName: state.username,
              ).toJson(),
              SetOptions(merge: true),
            );
      } else {
        debugPrint('This room already have three existing members......');
        _setError('This room already have three existing members');
      }
    }
  }

  _setError(String error) => state = state.copyWith(
        errorMessage: error,
        status: CreateUserPageStatus.error,
      );
}

@freezed
class CreateUserViewState with _$CreateUserViewState {
  const factory CreateUserViewState({
    @Default('') String username,
    @Default('') String mobile,
    @Default(StayType.Room) StayType selectedStaytype,
    @Default(Floor.F0) Floor selectedFloor,
    @Default(RoomF0.R1) dynamic selectedRoomNumber,
    @Default(Dormitory.D1) Dormitory selectedDormitoryNumber,
    @Default(CreateUserPageStatus.noError) CreateUserPageStatus status,
    String? errorMessage,
  }) = _CreateUserViewState;
}

enum CreateUserPageStatus {
  noError,
  error,
}
