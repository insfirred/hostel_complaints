import 'package:auto_route/auto_route.dart';

import '../ui/splash/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashScreen,
    ),
  ],
)
class $AppRouter {}
