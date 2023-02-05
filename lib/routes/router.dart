import 'package:auto_route/annotations.dart';
import 'package:improsso/presentation/signup/login_page.dart';
import 'package:improsso/presentation/signup/register_page.dart';
import 'package:improsso/presentation/splash/splash_page.dart';
import 'package:improsso/root.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: RegisterPage, initial: false),
  AutoRoute(page: LoginPage, initial: false),
  AutoRoute(page: RootWidget, initial: false),
])
class $AppRouter {}
