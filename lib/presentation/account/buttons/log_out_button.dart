import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/auth/auth_bloc/auth_bloc.dart';
import 'package:improsso/routes/router.gr.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        BlocProvider.of<AuthBloc>(context)
            .add(SignOutPressedEvent(context: context));
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Logout",
            style: themeData.textTheme.bodyText1!.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
