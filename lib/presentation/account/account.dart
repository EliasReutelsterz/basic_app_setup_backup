import 'package:flutter/material.dart';
import 'package:improsso/presentation/account/buttons/delete_account_button.dart';
import 'package:improsso/presentation/account/buttons/log_out_button.dart';
import 'package:improsso/presentation/account/widgets/profile_picture_widget.dart';
import 'package:improsso/presentation/account/widgets/test_for_observer_bloc.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const ProfilePictureWidget(),
          const SizedBox(height: 20),
          const TestForObserverBloc(),
          const SizedBox(height: 60),
          SizedBox(
            width: 250,
            child: Column(
              children: const [
                LogOutButton(),
                SizedBox(height: 10),
                DeleteAccountButton(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
