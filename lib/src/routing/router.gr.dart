// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../ui/auth/auth_view.dart' as _i2;
import '../ui/create_user/create_user_view.dart' as _i3;
import '../ui/file_complaint/carpentry/carpentry_complaint_view.dart' as _i6;
import '../ui/file_complaint/electricity/electricity_complaint_view.dart'
    as _i5;
import '../ui/home/home_view.dart' as _i4;
import '../ui/my_complaints/carpentry_complaints_list/carpentry_complaints_list_view.dart'
    as _i8;
import '../ui/my_complaints/electricity_complaints_list/electricity_complaints_list_view.dart'
    as _i7;
import '../ui/splash/splash_view.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthView(),
      );
    },
    CreateUserRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CreateUserView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
    ElectricityComplaintsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ElectricityComplaintsView(),
      );
    },
    CarpentryComplaintRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CarpentryComplaintView(),
      );
    },
    ElectricityComplaintsListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ElectricityComplaintsListView(),
      );
    },
    CarpentryComplaintsListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CarpentryComplaintsListView(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i9.RouteConfig(
          CreateUserRoute.name,
          path: 'create-user',
        ),
        _i9.RouteConfig(
          HomeRoute.name,
          path: 'home',
        ),
        _i9.RouteConfig(
          ElectricityComplaintsRoute.name,
          path: 'electricity-complaints',
        ),
        _i9.RouteConfig(
          CarpentryComplaintRoute.name,
          path: 'carpentry-complaints',
        ),
        _i9.RouteConfig(
          ElectricityComplaintsListRoute.name,
          path: 'electricity-complaints-list',
        ),
        _i9.RouteConfig(
          CarpentryComplaintsListRoute.name,
          path: 'carpentry-complaints-list',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthView]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.CreateUserView]
class CreateUserRoute extends _i9.PageRouteInfo<void> {
  const CreateUserRoute()
      : super(
          CreateUserRoute.name,
          path: 'create-user',
        );

  static const String name = 'CreateUserRoute';
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ElectricityComplaintsView]
class ElectricityComplaintsRoute extends _i9.PageRouteInfo<void> {
  const ElectricityComplaintsRoute()
      : super(
          ElectricityComplaintsRoute.name,
          path: 'electricity-complaints',
        );

  static const String name = 'ElectricityComplaintsRoute';
}

/// generated route for
/// [_i6.CarpentryComplaintView]
class CarpentryComplaintRoute extends _i9.PageRouteInfo<void> {
  const CarpentryComplaintRoute()
      : super(
          CarpentryComplaintRoute.name,
          path: 'carpentry-complaints',
        );

  static const String name = 'CarpentryComplaintRoute';
}

/// generated route for
/// [_i7.ElectricityComplaintsListView]
class ElectricityComplaintsListRoute extends _i9.PageRouteInfo<void> {
  const ElectricityComplaintsListRoute()
      : super(
          ElectricityComplaintsListRoute.name,
          path: 'electricity-complaints-list',
        );

  static const String name = 'ElectricityComplaintsListRoute';
}

/// generated route for
/// [_i8.CarpentryComplaintsListView]
class CarpentryComplaintsListRoute extends _i9.PageRouteInfo<void> {
  const CarpentryComplaintsListRoute()
      : super(
          CarpentryComplaintsListRoute.name,
          path: 'carpentry-complaints-list',
        );

  static const String name = 'CarpentryComplaintsListRoute';
}
