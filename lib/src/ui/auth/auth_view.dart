import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_complaints/src/ui/auth/otp_verify/otp_verify_view.dart';
import 'package:hostel_complaints/src/utils/extra_space.dart';

import 'auth_view_model.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      ref.read(authViewModelProvider.notifier).setMobile(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeScreen = ref.watch(
      authViewModelProvider.select((_) => _.screen),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: activeScreen == AuthScreen.otp
              ? const OtpVerifyView()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExtraHeight(40),
                    Text(
                      activeScreen == AuthScreen.login ? 'Login' : 'Register',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                      ),
                    ),
                    ExtraHeight(20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your mobile number',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    ExtraHeight(20),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(authViewModelProvider.notifier)
                            .setAuthScreen(AuthScreen.otp);
                      },
                      child: Text(
                        activeScreen == AuthScreen.login ? 'Login' : 'Register',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          activeScreen == AuthScreen.login
                              ? 'Don\'t have an account?'
                              : 'Already have an account?',
                          style: GoogleFonts.poppins(),
                        ),
                        TextButton(
                          onPressed: () {
                            activeScreen == AuthScreen.login
                                ? ref
                                    .read(authViewModelProvider.notifier)
                                    .setAuthScreen(AuthScreen.register)
                                : ref
                                    .read(authViewModelProvider.notifier)
                                    .setAuthScreen(AuthScreen.login);
                          },
                          child: Text(
                            activeScreen == AuthScreen.login
                                ? 'Register'
                                : 'Login',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
