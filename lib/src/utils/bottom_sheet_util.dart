import 'package:flutter/material.dart';

/// shows a bottom sheet
/// handles scenario of bottom sheet overlapping status bar
Future<T?> hostelComplaintsBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool isDismissible = true,
  bool enableDrag = true,
}) =>
    showModalBottomSheet<T>(
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        margin: EdgeInsets.only(
          top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .padding
              .top,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: builder(_),
      ),
    );
