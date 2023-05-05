// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:google_fonts/google_fonts.dart';

/// shows success message snack bar
showSuccessMessage(
  BuildContext context,
  String message, {
  double? bottomMargin,
}) =>
    _showSnackBar(
      context,
      message,
      const Color(0xFFdadada),
      bottomMargin: bottomMargin,
    );

/// shows error message snack bar
showErrorMessage(
  BuildContext context,
  String message, {
  double? bottomMargin,
}) =>
    _showSnackBar(
      context,
      message,
      const Color(0xFFFF3F3F),
      bottomMargin: bottomMargin,
      duration: message.length > 80 ? const Duration(milliseconds: 3500) : null,
    );

_showSnackBar(
  BuildContext context,
  String message,
  Color highlightColor, {
  double? bottomMargin,
  Duration? duration,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  // remove current SnackBar, if any
  scaffoldMessenger.removeCurrentSnackBar();
  // show the snack bar
  scaffoldMessenger.showSnackBar(
    SnackBar(
      margin: EdgeInsets.fromLTRB(
        15.0,
        5.0,
        15.0,
        bottomMargin ?? 10.0,
      ),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: highlightColor,
                width: 1.5,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.outfit(
                    fontSize: 13.5,
                    color: const Color(0xFFFCFCFC),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.cancel,
                  size: 20,
                  color: Color(0xFFDADADA),
                ),
                onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF323232),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: duration ??
          const Duration(
            milliseconds: 1500,
          ),
    ),
  );
}
