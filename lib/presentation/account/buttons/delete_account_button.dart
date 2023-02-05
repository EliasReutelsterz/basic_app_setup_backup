import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/auth/auth_bloc/auth_bloc.dart';
import 'package:improsso/domain/user_domain/entities/user_entity.dart';

class DeleteAccountButton extends StatelessWidget {
  final TextStyle style;
  const DeleteAccountButton({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text(
                      "Are you sure you want to delete your MyMensa account?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel", style: style)),
                    TextButton(
                        onPressed: () async {
                          BlocProvider.of<AuthBloc>(context)
                              .add(DeleteAccountPressedEvent(context: context));
                        },
                        child: Text(
                          "Delete",
                          style: style.copyWith(color: Colors.red),
                        ))
                  ],
                ));
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red[800], borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Delete account",
            style: themeData.textTheme.bodyText1!.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
