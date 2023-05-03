// 📦 Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
      // setting user data in user collection
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

      // List members =
      //     await ref.read(appRepositoryProvider.notifier).fetchMembersInRoom(
      //           state.selectedRoomNumber.toString().substring(8),
      //         );

      // if (members.length < 3) {
      //   members.add(
      //     {
      //       'id': userId,
      //       'name': state.username,
      //     },
      //   );
      //   // setting the members list in [rooms] collection
      //   await firebaseFirestore
      //       .collection('rooms')
      //       .doc(state.selectedRoomNumber.toString().substring(8))
      //       .set(
      //     {
      //       'room_number': state.selectedRoomNumber.toString().substring(8),
      //       'members': members,
      //     },
      //     SetOptions(merge: true),
      //   );

      ref
          .read(appRepositoryProvider.notifier)
          .setAppStatus(AppStatus.authenticatedWithUserData);

      //   } else {
      //     debugPrint('Room Already Full');
      //     _setError(
      //       'This room is already having 3 members, Enter your correct room number.',
      //     );
      //   }
      // } else {
      //   await firebaseFirestore
      //       .collection('users')
      //       .doc(ref.read(appRepositoryProvider).authUser?.uid)
      //       .set(
      //     {
      //       'dormitory_number': state.selectedDormitoryNumber.name,
      //     },
      //     SetOptions(merge: true),
      //   );
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
  _setError(
    String error,
  ) =>
      state = state.copyWith(
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
