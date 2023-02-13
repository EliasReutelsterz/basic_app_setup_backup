import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/user/pictures_bloc/bloc/pictures_bloc.dart';

class AddProfilePictureButton extends StatelessWidget {
  const AddProfilePictureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.85,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 20,
        child: IconButton(
          icon: Icon(Icons.upload_file_outlined,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            BlocProvider.of<PicturesBloc>(context)
                .add(PickAndUploadPictureEvent(context: context));
          },
        ),
      ),
    );
  }
}
