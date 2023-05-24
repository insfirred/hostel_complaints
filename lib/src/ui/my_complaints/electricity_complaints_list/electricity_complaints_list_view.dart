import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/firestore_models.dart/complaint_data.dart';
import 'electricity_complaints_list_view_model.dart';

class ElectricityComplaintsListView extends ConsumerWidget {
  const ElectricityComplaintsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Electricity Complaints'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pending Complaints'),
              Tab(text: 'All Complaints'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              _PendingComplaintsView(),
              _AllComplaintsView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllComplaintsView extends ConsumerWidget {
  const _AllComplaintsView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allComplaints = ref.watch(
      electricityComplaintsListViewModelProvider.select((_) => _.allComplaints),
    );
    final status = ref.watch(
      electricityComplaintsListViewModelProvider.select((_) => _.status),
    );
    final errorMessage = ref.watch(
      electricityComplaintsListViewModelProvider.select((_) => _.error),
    );

    return status == ElectricityComplaintsListViewStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : status == ElectricityComplaintsListViewStatus.error
            ? Center(
                child: Text(errorMessage ?? 'Something went wrong'),
              )
            : ListView.builder(
                itemCount: allComplaints.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index != 0 ? 8 : 20,
                    bottom: index != (allComplaints.length - 1) ? 8 : 20,
                    left: 20,
                    right: 20,
                  ),
                  child: _ComplaintItem(
                    complaintItem: allComplaints[index],
                  ),
                ),
              );
  }
}

class _PendingComplaintsView extends ConsumerWidget {
  const _PendingComplaintsView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingComplaints = ref.watch(
      electricityComplaintsListViewModelProvider
          .select((_) => _.pendingComplaints),
    );
    final status = ref.watch(
      electricityComplaintsListViewModelProvider.select((_) => _.status),
    );
    final errorMessage = ref.watch(
      electricityComplaintsListViewModelProvider.select((_) => _.error),
    );

    return status == ElectricityComplaintsListViewStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : status == ElectricityComplaintsListViewStatus.error
            ? Center(
                child: Text(errorMessage ?? 'Something went wrong'),
              )
            : ListView.builder(
                itemCount: pendingComplaints.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index != 0 ? 8 : 20,
                    bottom: index != (pendingComplaints.length - 1) ? 8 : 20,
                    left: 20,
                    right: 20,
                  ),
                  child: _ComplaintItem(
                    onPendingComplaintsView: true,
                    complaintItem: pendingComplaints[index],
                  ),
                ),
              );
  }
}

class _ComplaintItem extends StatelessWidget {
  const _ComplaintItem({
    required this.complaintItem,
    this.onPendingComplaintsView = false,
  });

  final ComplaintData complaintItem;
  final bool onPendingComplaintsView;

  @override
  Widget build(BuildContext context) {
    bool isComplaintTypeOther = complaintItem.complaintType == 'Others';
    bool isDescriptionNull = complaintItem.description == null;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 230, 231, 243),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: ${complaintItem.date}',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          if (!onPendingComplaintsView) ...[
            Text(
              complaintItem.isComplaintFulfilled == true
                  ? 'Status: Completed'
                  : 'Status: Pending',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
          Text(
            isComplaintTypeOther
                ? 'Complaint About: ${complaintItem.others}'
                : 'Complaint About: ${complaintItem.complaintType}',
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          if (!isDescriptionNull) ...[
            Text(
              'Description: ${complaintItem.description}',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
