import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_complaints/src/ui/auth/auth_view_model.dart';
import 'package:hostel_complaints/src/utils/extra_space.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyView extends ConsumerStatefulWidget {
  const OtpVerifyView({super.key});

  @override
  ConsumerState<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends ConsumerState<OtpVerifyView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width / 6,
      height: 50,
      textStyle: GoogleFonts.poppins(
        fontSize: 20,
        color: const Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(234, 239, 243, 1),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color.fromARGB(255, 78, 153, 224),
      ),
      borderRadius: BorderRadius.circular(8),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtraHeight(50),
        Text(
          'Enter OTP',
          style: GoogleFonts.poppins(fontSize: 30),
        ),
        ExtraHeight(20),
        Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          onCompleted: (pin) => print(pin),
        ),
        ExtraHeight(50),
        ElevatedButton(
          onPressed: () {
            ref
                .read(authViewModelProvider.notifier)
                .setAuthScreen(AuthScreen.login);
          },
          child: const Text('Submit'),
        ),
        ExtraHeight(50),
        ElevatedButton(
          onPressed: () {
            ref
                .read(authViewModelProvider.notifier)
                .setAuthScreen(AuthScreen.login);
          },
          child: const Text('Return to login'),
        ),
      ],
    );
  }
}
