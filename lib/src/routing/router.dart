import 'package:auto_route/auto_route.dart';

import '../ui/auth/auth_page.dart';
import '../ui/create_profile/create_profile_page.dart';
import '../ui/home/home_page.dart';
import '../ui/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashPage,
    ),
    AutoRoute(
      path: 'auth',
      page: AuthPage,
    ),
    AutoRoute(
      path: 'create-profile',
      page: CreateProfilePage,
    ),
    AutoRoute(
      path: 'home',
      page: HomePage,
    ),
  ],
)
class $AppRouter {}
