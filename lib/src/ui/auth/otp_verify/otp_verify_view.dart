import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/extra_space.dart';
import '../auth_view_model.dart';

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
    controller.addListener(
      () {
        ref.read(authViewModelProvider.notifier).setOtp(controller.text);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // default theme for otp box
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: GoogleFonts.poppins(
        fontSize: 15,
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

    // focussed theme for otp box
    final focusedPinTheme = defaultPinTheme.copyWith(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 78, 153, 224),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              controller: controller,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              onCompleted: (pin) => debugPrint(pin),
            ),
          ],
        ),
        ExtraHeight(50),
        ElevatedButton(
          onPressed: () {
            ref.read(authViewModelProvider.notifier).verifyOtp();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
