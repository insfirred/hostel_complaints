import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintConfirmationSheet extends ConsumerWidget {
  const ComplaintConfirmationSheet({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your complaint',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Date',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          // Text(
          //   DateFormat('dd MMMM yyyy').format(
          //     ref.read(complaintConfirmationSheetModelProvider).complaintDate,
          //   ),
          //   style: GoogleFonts.poppins(fontSize: 16),
          // ),
          Text(
            'Complaint about',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Date',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Description',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Date',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Complaint from',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Date',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {},
            child: const Text('File complaint'),
          ),
        ],
      ),
    );
  }
}
