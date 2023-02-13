import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/user/pictures_bloc/bloc/pictures_bloc.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesBloc, PicturesState>(
      builder: (context, picturesState) {
        if (picturesState is PicturesSuccess) {
          return picturesState.picturesEntity.profilePicture;
        } else {
          return const Image(
              image: AssetImage("assets/images/profile_default.jpeg"));
        }
      },
    );
  }
}
