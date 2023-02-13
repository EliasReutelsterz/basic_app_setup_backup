import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/auth/auth_bloc/auth_bloc.dart';
import 'package:improsso/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthentificated) {
          context.router.replace(const RootWidgetRoute());
        } else if (state is AuthStateUnauthentificated) {
          context.router.replace(const LoginPageRoute());
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            child: CircularProgressIndicator(
              color: Theme.of(context).bottomAppBarColor,
              backgroundColor: Colors.white,
            ),
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
