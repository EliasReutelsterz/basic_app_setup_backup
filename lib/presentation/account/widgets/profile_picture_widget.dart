import 'package:flutter/material.dart';
import 'package:improsso/presentation/account/buttons/add_profile_picture_button.dart';
import 'package:improsso/presentation/account/buttons/delete_profile_picture.dart';
import 'package:improsso/presentation/account/widgets/profile_picture.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: const [
                Positioned(
                  top: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: FittedBox(
                            fit: BoxFit.cover, child: ProfilePicture())),
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 5,
                  child: AddProfilePictureButton(),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: DeleteProfilePicture(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
