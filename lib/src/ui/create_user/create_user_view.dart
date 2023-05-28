import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../enums/enums.dart';
import '../../logic/repositories/app_repository.dart';
import '../../routing/router.gr.dart';
import '../../utils/extra_space.dart';
import '../../utils/snackbar_utils.dart';
import 'create_user_view_model.dart';

class CreateUserView extends ConsumerStatefulWidget {
  const CreateUserView({super.key});

  @override
  ConsumerState<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends ConsumerState<CreateUserView> {
  late final TextEditingController nameFieldController;

  @override
  void initState() {
    nameFieldController = TextEditingController();
    nameFieldController.addListener(() {
      ref
          .read(createUserViewModelProvider.notifier)
          .setName(nameFieldController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    nameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedStaytype = ref.watch(
      createUserViewModelProvider.select((_) => _.selectedStaytype),
    );
    final selectedFloor = ref.watch(
      createUserViewModelProvider.select((_) => _.selectedFloor),
    );
    final selectedRoomNumber = ref.watch(
      createUserViewModelProvider.select((_) => _.selectedRoomNumber),
    );
    final selectedDormitoryNumber = ref.watch(
      createUserViewModelProvider.select((_) => _.selectedDormitoryNumber),
    );
    // final errorMessage = ref.watch(
    //   createUserViewModelProvider.select((_) => _.errorMessage),
    // );

    ref.listen(
      appRepositoryProvider,
      (previous, next) {
        if (next.appStatus == AppStatus.authenticatedWithUserData) {
          context.router.replace(const HomeRoute());
        } else if (next.appStatus == AppStatus.unauthenticated) {
          context.replaceRoute(const AuthRoute());
        }
      },
    );

    /// it adjusts room field according to floor.
    /// and handles error
    ref.listen(
      createUserViewModelProvider,
      (previous, next) {
        if (previous?.selectedFloor != next.selectedFloor) {
          dynamic roomNumber = RoomF0.R1;
          if (next.selectedFloor == Floor.F0) {
            roomNumber = RoomF0.R1;
          } else if (next.selectedFloor == Floor.F1) {
            roomNumber = RoomF1.R101;
          } else if (next.selectedFloor == Floor.F2) {
            roomNumber = RoomF2.R201;
          } else if (next.selectedFloor == Floor.F3) {
            roomNumber = RoomF3.R301;
          } else if (next.selectedFloor == Floor.F4) {
            roomNumber = RoomF4.R401;
          } else if (next.selectedFloor == Floor.F5) {
            roomNumber = RoomF5.R501;
          }
          ref
              .read(createUserViewModelProvider.notifier)
              .setRoomNumber(roomNumber);
        }

        if (next.status == CreateUserPageStatus.error) {
          debugPrint(
              'The error is: ${ref.watch(createUserViewModelProvider).errorMessage}');
          showErrorMessage(
            context,
            ref.watch(createUserViewModelProvider).errorMessage ??
                'Something went wrong',
          );
        }
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExtraHeight(50),
                TextField(
                  maxLength: 20,
                  controller: nameFieldController,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Your name',
                  ),
                ),
                ExtraHeight(40),

                // Stay Type Section
                Text(
                  'Stay Type',
                  style: GoogleFonts.poppins(fontSize: 17),
                ),
                DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  value: selectedStaytype,
                  items: StayType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          onTap: () => ref
                              .read(createUserViewModelProvider.notifier)
                              .setStayType(type),
                          child: Text(
                              type == StayType.Room ? 'Room' : 'Dormitory'),
                        ),
                      )
                      .toList(),
                  onChanged: (_) {},
                ),

                if (selectedStaytype == StayType.Room) ...[
                  // Floor Section
                  Text(
                    'Floor',
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),
                  _buildFloorDropdown(selectedFloor),

                  // room section
                  Text(
                    'Room Number',
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),

                  _buildRoomNumberDropdown(
                    floor: selectedFloor,
                    selectedRoomNumber: selectedRoomNumber,
                  ),
                ] else ...[
                  // Dormitory Section
                  Text(
                    'Dormitory Type',
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),
                  _buildDormitoryDropdown(selectedDormitoryNumber),
                ],
                ExtraHeight(30),
                ElevatedButton(
                  onPressed: () => ref
                      .read(createUserViewModelProvider.notifier)
                      .onSubmitPressed(),
                  child: const Text('Submit'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     FirebaseAuth.instance.signOut();
                //   },
                //   child: const Text('signout'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButton _buildFloorDropdown(Floor selectedFloor) => DropdownButton(
        value: selectedFloor,
        borderRadius: BorderRadius.circular(10),
        items: Floor.values
            .map(
              (floor) => DropdownMenuItem(
                value: floor,
                onTap: () => ref
                    .read(createUserViewModelProvider.notifier)
                    .setFloor(floor),
                child: Text(
                  floor == Floor.F0
                      ? 'Ground floor'
                      : floor == Floor.F1
                          ? '1st floor'
                          : floor == Floor.F2
                              ? '2nd floor'
                              : floor == Floor.F3
                                  ? '3rd floor'
                                  : floor == Floor.F4
                                      ? '4th floor'
                                      : '5th floor',
                ),
              ),
            )
            .toList(),
        onChanged: (_) {},
      );

  DropdownButton _buildRoomNumberDropdown({
    required Floor floor,
    required dynamic selectedRoomNumber,
  }) =>
      DropdownButton(
        value: selectedRoomNumber,
        borderRadius: BorderRadius.circular(10),
        items: floor == Floor.F0
            // Ground Floor
            ? RoomF0.values
                .map(
                  (roomNumber) => DropdownMenuItem(
                    value: roomNumber,
                    onTap: () => ref
                        .read(createUserViewModelProvider.notifier)
                        .setRoomNumber(roomNumber),
                    child: Text(roomNumber.toString().substring(8)),
                  ),
                )
                .toList()
            : floor == Floor.F1
                // 1st Floor
                ? RoomF1.values
                    .map(
                      (roomNumber) => DropdownMenuItem(
                        value: roomNumber,
                        onTap: () => ref
                            .read(createUserViewModelProvider.notifier)
                            .setRoomNumber(roomNumber),
                        child: Text(roomNumber.toString().substring(8)),
                      ),
                    )
                    .toList()
                : floor == Floor.F2
                    // 2nd Floor
                    ? RoomF2.values
                        .map(
                          (roomNumber) => DropdownMenuItem(
                            value: roomNumber,
                            onTap: () => ref
                                .read(createUserViewModelProvider.notifier)
                                .setRoomNumber(roomNumber),
                            child: Text(roomNumber.toString().substring(8)),
                          ),
                        )
                        .toList()
                    : floor == Floor.F3
                        // 3rd Floor
                        ? RoomF3.values
                            .map(
                              (roomNumber) => DropdownMenuItem(
                                value: roomNumber,
                                onTap: () => ref
                                    .read(createUserViewModelProvider.notifier)
                                    .setRoomNumber(roomNumber),
                                child: Text(roomNumber.toString().substring(8)),
                              ),
                            )
                            .toList()
                        : floor == Floor.F4
                            // 4th Floor
                            ? RoomF4.values
                                .map(
                                  (roomNumber) => DropdownMenuItem(
                                    value: roomNumber,
                                    onTap: () => ref
                                        .read(createUserViewModelProvider
                                            .notifier)
                                        .setRoomNumber(roomNumber),
                                    child: Text(
                                        roomNumber.toString().substring(8)),
                                  ),
                                )
                                .toList()
                            // 5th Floor
                            : RoomF5.values
                                .map(
                                  (roomNumber) => DropdownMenuItem(
                                    value: roomNumber,
                                    onTap: () => ref
                                        .read(createUserViewModelProvider
                                            .notifier)
                                        .setRoomNumber(roomNumber),
                                    child: Text(
                                        roomNumber.toString().substring(8)),
                                  ),
                                )
                                .toList(),
        onChanged: (_) {},
      );

  DropdownButton _buildDormitoryDropdown(Dormitory selectedDormitoryNumber) =>
      DropdownButton(
        borderRadius: BorderRadius.circular(10),
        value: selectedDormitoryNumber,
        items: Dormitory.values
            .map(
              (dormitory) => DropdownMenuItem(
                value: dormitory,
                onTap: () => ref
                    .read(createUserViewModelProvider.notifier)
                    .setDormitoryNumber(dormitory),
                child: Text(
                  dormitory.toString().substring(10),
                ),
              ),
            )
            .toList(),
        onChanged: (_) {},
      );
}
