part of 'pictures_bloc.dart';

abstract class PicturesEvent {}

class LoadPicturesEvent extends PicturesEvent {}

class DeleteProfilePictureEvent extends PicturesEvent {
  final dynamic context;
  DeleteProfilePictureEvent({required this.context});
}

class PickAndUploadPictureEvent extends PicturesEvent {
  final dynamic context;
  PickAndUploadPictureEvent({required this.context});
}
