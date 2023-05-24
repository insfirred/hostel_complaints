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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../ui/auth/auth_view.dart' as _i2;
import '../ui/complaints/carpentry/carpentry_complaint_view.dart' as _i6;
import '../ui/complaints/electricity/electricity_complaint_view.dart' as _i5;
import '../ui/create_user/create_user_view.dart' as _i3;
import '../ui/home/home_view.dart' as _i4;
import '../ui/splash/splash_view.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthView(),
      );
    },
    CreateUserRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CreateUserView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
    ElectricityComplaintsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ElectricityComplaintsView(),
      );
    },
    CarpentryComplaintRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CarpentryComplaintView(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i7.RouteConfig(
          CreateUserRoute.name,
          path: 'create-user',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: 'home',
        ),
        _i7.RouteConfig(
          ElectricityComplaintsRoute.name,
          path: 'electricity-complaints',
        ),
        _i7.RouteConfig(
          CarpentryComplaintRoute.name,
          path: 'carpentry-complaints',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthView]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.CreateUserView]
class CreateUserRoute extends _i7.PageRouteInfo<void> {
  const CreateUserRoute()
      : super(
          CreateUserRoute.name,
          path: 'create-user',
        );

  static const String name = 'CreateUserRoute';
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ElectricityComplaintsView]
class ElectricityComplaintsRoute extends _i7.PageRouteInfo<void> {
  const ElectricityComplaintsRoute()
      : super(
          ElectricityComplaintsRoute.name,
          path: 'electricity-complaints',
        );

  static const String name = 'ElectricityComplaintsRoute';
}

/// generated route for
/// [_i6.CarpentryComplaintView]
class CarpentryComplaintRoute extends _i7.PageRouteInfo<void> {
  const CarpentryComplaintRoute()
      : super(
          CarpentryComplaintRoute.name,
          path: 'carpentry-complaints',
        );

  static const String name = 'CarpentryComplaintRoute';
}
