import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improsso/application/user/pictures_bloc/bloc/pictures_bloc.dart';

class DeleteProfilePicture extends StatelessWidget {
  const DeleteProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicturesBloc, PicturesState>(
      builder: (context, picturesState) {
        if (picturesState is PicturesSuccess) {
          return Opacity(
            opacity: 0.85,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 20,
              child: IconButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: (() {
                    BlocProvider.of<PicturesBloc>(context)
                        .add(DeleteProfilePictureEvent(context: context));
                  }),
                  icon: Icon(Icons.delete_outline,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          );
        } else {
          return Opacity(
            opacity: 0.7,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 20,
              child: IconButton(
                  onPressed: (() {}),
                  icon: Icon(Icons.delete_outline,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          );
        }
      },
    );
  }
}
