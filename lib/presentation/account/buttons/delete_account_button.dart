import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/auth/auth_bloc/auth_bloc.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({Key? key}) : super(key: key);

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
                        child: Text("Cancel",
                            style: TextStyle(
                                color: themeData.colorScheme.onPrimary,
                                fontSize: 20))),
                    TextButton(
                        onPressed: () async {
                          BlocProvider.of<AuthBloc>(context)
                              .add(DeleteAccountPressedEvent(context: context));
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red, fontSize: 20),
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
