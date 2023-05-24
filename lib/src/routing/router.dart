import 'package:auto_route/auto_route.dart';

import '../ui/auth/auth_view.dart';
import '../ui/create_user/create_user_view.dart';
import '../ui/file_complaint/carpentry/carpentry_complaint_view.dart';
import '../ui/file_complaint/electricity/electricity_complaint_view.dart';
import '../ui/home/home_view.dart';
import '../ui/my_complaints/electricity_complaints_list/electricity_complaints_list_view.dart';
import '../ui/splash/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashView,
    ),
    AutoRoute(
      path: 'auth',
      page: AuthView,
    ),
    AutoRoute(
      path: 'create-user',
      page: CreateUserView,
    ),
    AutoRoute(
      path: 'home',
      page: HomeView,
    ),
    AutoRoute(
      path: 'electricity-complaints',
      page: ElectricityComplaintsView,
    ),
    AutoRoute(
      path: 'carpentry-complaints',
      page: CarpentryComplaintView,
    ),
    AutoRoute(
      path: 'my-complaints',
      page: ElectricityComplaintsListView,
    )
  ],
)
class $AppRouter {}
