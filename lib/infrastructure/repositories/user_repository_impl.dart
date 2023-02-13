import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:improsso/core/errors/erros.dart';
import 'package:improsso/domain/auth_domain/repositories/auth_repository.dart';
import 'package:improsso/domain/user_domain/entities/pictures_entity.dart';
import 'package:improsso/domain/user_domain/entities/user_entity.dart';
import 'package:improsso/domain/user_domain/failures/failures.dart';
import 'package:improsso/domain/user_domain/failures/user_failures.dart';
import 'package:improsso/domain/user_domain/repositories/user_repository.dart';
import 'package:improsso/infrastructure/models/user_model_FIREBASE.dart';
import 'package:improsso/injection.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Stream<Either<UserFailure, UserEntity>> getAllData() async* {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final currentUser =
        userOption.getOrElse(() => throw NotAuthentificatedError());
    //statt der drei Zeilen hier drüber auch möglich: User user = FirebaseAuth.instance.currentUser!;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Stream<Either<UserFailure, UserEntity>> userEntityStream =
        users.doc(currentUser.id.value).snapshots().map((snapshot) {
      return right<UserFailure, UserEntity>(
          UserModelFIREBASE.fromFirestoreAsDocument(snapshot).toDomain());
    }).handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains('permission-denied') ||
            e.code.contains("PERMISSION_DENIED")) {
          return left(InsufficientPermissions());
        } else {
          return left(GeneralUserFailure());
        }
      } else {
        return left(GeneralUserFailure());
      }
    });
    yield* userEntityStream;
  }

  @override
  Future<Either<Failure, PicturesEntity>> loadProfilePicture() async {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final currentUser =
        userOption.getOrElse(() => throw NotAuthentificatedError());
    const oneMegabyte = 1024 * 1024;
    final storageRef = FirebaseStorage.instance.ref();
    final pathReference =
        storageRef.child("/images/${currentUser.id.value}/profile_picture");
    final Either<Failure, PicturesEntity> failureOrPicturesEntity =
        await pathReference.getData(oneMegabyte).then((data) {
      try {
        return right(PicturesEntity(profilePicture: Image.memory(data!)));
      } catch (e) {
        return left(GeneralFailure());
      }
    });
    return failureOrPicturesEntity;
  }

  @override
  Future<Either<Failure, Unit>> deleteProfilePicture() async {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final currentUser =
        userOption.getOrElse(() => throw NotAuthentificatedError());
    final storageRef = FirebaseStorage.instance.ref();
    final pathReference =
        storageRef.child("/images/${currentUser.id.value}/profile_picture");
    try {
      return await pathReference.delete().then((value) => right(unit));
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> pickAndUploadProfilePicture() async {
    try {
      final ImagePicker picker = ImagePicker();
      return await picker
          .pickImage(source: ImageSource.gallery, imageQuality: 1)
          .then((pickedFile) async {
        if (pickedFile != null) {
          File photo = File(pickedFile.path);
          User user = FirebaseAuth.instance.currentUser!;
          final storageRef = FirebaseStorage.instance.ref();
          final folderRef =
              storageRef.child('/images/${user.uid}/profile_picture');
          return await folderRef.putFile(photo).then((p0) => right(unit));
        } else {
          return left(GeneralFailure());
        }
      });
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUsername(String input) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      return FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "username": input,
      }).then((value) {
        return right(unit);
      });
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
