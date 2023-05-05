import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_complaints/src/utils/snackbar_utils.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../utils/extra_space.dart';
import 'electricity_complaint_view_model.dart';

class ElectricityComplaintsView extends ConsumerWidget {
  const ElectricityComplaintsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(electricityComplaintViewModelProvider, (previous, next) {
      if (previous?.status == ElectricityComplaintViewStatus.error) {
        showErrorMessage(
          context,
          ref.watch(electricityComplaintViewModelProvider).errorMessage ??
              'Something went wrong',
        );
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _FieldTitle(label: 'Date'),
              ExtraHeight(8),
              Row(
                children: [
                  const Icon(Icons.date_range),
                  ExtraWidth(10),
                  Text(
                    DateFormat('dd MMMM yyyy').format(
                      ref
                          .read(electricityComplaintViewModelProvider)
                          .complaintDate,
                    ),
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ],
              ),
              ExtraHeight(32),
              const _FieldTitle(label: 'Complaint About'),
              const _ComplaintAbout(),
              ExtraHeight(32),
              const _FieldTitle(label: 'Description (optional)'),
              const _DescriptionField(),
              ExtraHeight(40),
              SlideAction(
                onSubmit: () async {
                  // file complaint
                  ref
                      .read(electricityComplaintViewModelProvider.notifier)
                      .fileComplaintSlided();
                  await Future.delayed(const Duration(milliseconds: 500));
                  // showSuccessMessage(context, 'Complaint filed successfully');
                  // Navigator.pop(context);
                },
                text: 'File Complaint',
                textStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                ),
                height: 50,
                sliderButtonIconSize: 15,
                sliderButtonIconPadding: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionField extends ConsumerStatefulWidget {
  const _DescriptionField();

  @override
  ConsumerState<_DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends ConsumerState<_DescriptionField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    controller.addListener(
      () => ref
          .read(electricityComplaintViewModelProvider.notifier)
          .setDescription(controller.text),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'What exactly is the problem?',
      ),
    );
  }
}

class _ComplaintAbout extends ConsumerStatefulWidget {
  const _ComplaintAbout();

  @override
  ConsumerState<_ComplaintAbout> createState() => _ComplaintAboutState();
}

class _ComplaintAboutState extends ConsumerState<_ComplaintAbout> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(
      () => ref
          .read(electricityComplaintViewModelProvider.notifier)
          .setOthers(controller.text),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedComplaintIndex = ref.watch(
        electricityComplaintViewModelProvider
            .select((_) => _.selectedComplaintType?.index));

    final showOthersTextField = ref.watch(
          electricityComplaintViewModelProvider
              .select((_) => _.selectedComplaintType),
        ) ==
        ElectricityComplaintType.Others;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ElectricityComplaintType.values
          .map(
            (complaintType) => Row(
              children: [
                Radio(
                  value: complaintType.index,
                  groupValue: selectedComplaintIndex,
                  onChanged: (value) {
                    ref
                        .read(electricityComplaintViewModelProvider.notifier)
                        .setComplaintType(value ?? 0);
                  },
                ),
                Text(
                  complaintType.name,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                ExtraWidth(12),
                if (showOthersTextField &&
                    complaintType.index ==
                        ElectricityComplaintType.values.length - 1) ...[
                  // showing the others text field only when user selects the others option
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'others',
                      ),
                    ),
                  ),
                ],
              ],
            ),
          )
          .toList(),
    );
  }
}

class _FieldTitle extends StatelessWidget {
  const _FieldTitle({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
