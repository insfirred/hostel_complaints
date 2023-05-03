import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/repositories/app_repository.dart';
import '../../routing/router.gr.dart';
import '../../utils/extra_space.dart';
import 'home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // navigate to Auth route whwnever user signout
    ref.listen(appRepositoryProvider, (prev, next) {
      if (next.appStatus == AppStatus.unauthenticated) {
        context.replaceRoute(const AuthRoute());
      }
    });

    final userData = ref.watch(
      homeViewModelProvider.select((_) => _.userData),
    );

    final status = ref.watch(
      homeViewModelProvider.select((_) => _.status),
    );

    final greetingMessage = ref.watch(
      homeViewModelProvider.select((_) => _.greetingMessage),
    );

    return Scaffold(
      body: SafeArea(
        child: status == HomeViewStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExtraHeight(10),
                    Text(
                      greetingMessage ?? 'Good Afternoon',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      userData!.name,
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
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text('sign out'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
