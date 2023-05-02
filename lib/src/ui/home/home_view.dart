import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_complaints/src/utils/extra_space.dart';

import '../../logic/repositories/app_repository.dart';
import '../../routing/router.gr.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appRepositoryProvider, (prev, next) {
      if (next.appStatus == AppStatus.unauthenticated) {
        context.replaceRoute(const AuthRoute());
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExtraHeight(10),
              Text(
                'Good Afternoon',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Kalash',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.navigateTo(const ElectricityComplaintsRoute());
                },
                child: const Text('Electricity'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Carpentery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
