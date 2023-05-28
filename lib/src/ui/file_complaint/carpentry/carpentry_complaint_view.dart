// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_complaints/src/utils/extra_space.dart';
import 'package:hostel_complaints/src/utils/snackbar_utils.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'carpentry_complaint_view_model.dart';

class CarpentryComplaintView extends ConsumerWidget {
  const CarpentryComplaintView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(carpentryComplaintViewModelprovider, (previous, next) {
      if (next.status == CarpentryComplaintViewStatus.error) {
        showErrorMessage(
          context,
          ref.watch(
                carpentryComplaintViewModelprovider
                    .select((_) => _.errorMessage),
              ) ??
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
                    DateFormat('dd MMM yyyy').format(
                      ref
                          .read(carpentryComplaintViewModelprovider)
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
              const _FieldTitle(label: 'Descriptional (optional)'),
              const _DescriptionField(),
              ExtraHeight(40),
              SlideAction(
                onSubmit: () async {
                  await ref
                      .read(carpentryComplaintViewModelprovider.notifier)
                      .fileComplaintSlided();

                  if (ref.watch(carpentryComplaintViewModelprovider).status ==
                      CarpentryComplaintViewStatus.noError) {
                    showSuccessMessage(context, 'Complaint filed successfully');
                    Navigator.pop(context);
                  } else {
                    print(
                      'yaha aana chahiye....',
                    );
                  }
                },
                text: 'File Complaint',
                textStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                ),
                height: 50,
                sliderButtonIconSize: 15,
                sliderButtonIconPadding: 8,

                // reversed: true,
              ),
            ],
          ),
        ),
      ),
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
          .read(carpentryComplaintViewModelprovider.notifier)
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
      decoration: InputDecoration(
        hintText: 'What exactly is the problem?',
        hintStyle: GoogleFonts.poppins(fontSize: 14),
      ),
    );
  }
}

class _ComplaintAbout extends ConsumerStatefulWidget {
  const _ComplaintAbout();

  @override
  ConsumerState<_ComplaintAbout> createState() => __ComplaintAboutState();
}

class __ComplaintAboutState extends ConsumerState<_ComplaintAbout> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(
      () => ref
          .read(carpentryComplaintViewModelprovider.notifier)
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
      carpentryComplaintViewModelprovider
          .select((_) => _.selectedComplaintType?.index),
    );
    final showOthersTextField = ref.watch(
          carpentryComplaintViewModelprovider
              .select((_) => _.selectedComplaintType),
        ) ==
        CarpentryComplaintType.Others;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: CarpentryComplaintType.values
          .map(
            (complaintType) => Row(
              children: [
                Radio(
                  value: complaintType.index,
                  groupValue: selectedComplaintIndex,
                  onChanged: (value) {
                    ref
                        .read(carpentryComplaintViewModelprovider.notifier)
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
                        CarpentryComplaintType.values.length - 1) ...[
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
