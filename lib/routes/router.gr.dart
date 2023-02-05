// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../root.dart' as _i4;
import '../presentation/signup/login_page.dart' as _i3;
import '../presentation/signup/register_page.dart' as _i2;
import '../presentation/splash/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    RootWidgetRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RootWidget());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashPageRoute.name, path: '/'),
        _i5.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i5.RouteConfig(LoginPageRoute.name, path: '/login-page'),
        _i5.RouteConfig(RootWidgetRoute.name, path: '/root-widget')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i5.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterPageRoute extends _i5.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i5.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i4.RootWidget]
class RootWidgetRoute extends _i5.PageRouteInfo<void> {
  const RootWidgetRoute() : super(RootWidgetRoute.name, path: '/root-widget');

  static const String name = 'RootWidgetRoute';
}
