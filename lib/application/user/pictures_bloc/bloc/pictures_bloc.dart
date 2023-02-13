import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:improsso/domain/user_domain/entities/pictures_entity.dart';
import 'package:improsso/domain/user_domain/failures/failures.dart';
import 'package:improsso/infrastructure/repositories/user_repository_impl.dart';
part 'pictures_event.dart';
part 'pictures_state.dart';

class PicturesBloc extends Bloc<PicturesEvent, PicturesState> {
  PicturesBloc() : super(PicturesInitial()) {
    on<LoadPicturesEvent>((event, emit) async {
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();
      Either<Failure, PicturesEntity> failureOrPicturesEntity =
          await userRepositoryImpl.loadProfilePicture();
      failureOrPicturesEntity.fold(
          (failure) => emit(PicturesFailure(
              failure: "Ups, something gone wrong. Please try again!")),
          (picturesEntity) =>
              emit(PicturesSuccess(picturesEntity: picturesEntity)));
    });

    on<DeleteProfilePictureEvent>((event, emit) async {
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();
      await userRepositoryImpl.deleteProfilePicture().then((failureOrUnit) {
        failureOrUnit.fold((failure) {
          ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Ups, something gone wrong. Please try again!")));
        }, (unitBack) {
          return emit(PicturesFailure(failure: "No Picture anymore"));
        });
      });
    });

    on<PickAndUploadPictureEvent>((event, emit) {
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();
      userRepositoryImpl.pickAndUploadProfilePicture().then((failureOrUnit) {
        failureOrUnit.fold((failure) {
          ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Ups, something gone wrong. Please try again!")));
        }, (unitBack) {
          return add(LoadPicturesEvent());
        });
      });
    });
  }
}
