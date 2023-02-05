import 'package:flutter/material.dart';
import 'package:improsso/presentation/account/buttons/delete_account_button.dart';
import 'package:improsso/presentation/account/buttons/log_out_button.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Theme.of(context)
        .textTheme
        .headline2!
        .copyWith(fontSize: 20, color: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Text("AccountPage"),
          LogOutButton(),
          DeleteAccountButton(style: _style),
        ]),
      ),
    );
  }
}
