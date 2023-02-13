part of 'pictures_bloc.dart';

abstract class PicturesState {}

class PicturesInitial extends PicturesState {}

class PicturesLoading extends PicturesState {}

class PicturesSuccess extends PicturesState {
  final PicturesEntity picturesEntity;
  PicturesSuccess({required this.picturesEntity});
}

class PicturesFailure extends PicturesState {
  final String failure;
  PicturesFailure({required this.failure});
}
