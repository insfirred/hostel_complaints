import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/repositories/app_repository.dart';
import '../../routing/router.gr.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      appRepositoryProvider,
      (previous, next) {
        _navigateBasedOnAuthStatus(next.appStatus!);
      },
    );
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }

  _navigateBasedOnAuthStatus(AppStatus authStatus) async {
    final router = context.router;
    if (authStatus == AppStatus.unauthenticated) {
      router.replace(const AuthRoute());
      debugPrint('NAVIGATION: Splash replaced with Auth Page');
    } else if (authStatus == AppStatus.authenticatedWithNoUserData) {
      router.replace(const CreateProfileRoute());
      debugPrint('NAVIGATION: Splash replaced with CreateMail Page');
    } else if (authStatus == AppStatus.authenticatedWithUserData) {
      router.replace(const HomeRoute());
      debugPrint('NAVIGATION: Splash replaced with Home Page');
    }
  }
}
