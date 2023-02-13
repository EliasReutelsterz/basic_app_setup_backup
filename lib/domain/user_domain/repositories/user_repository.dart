import 'package:dartz/dartz.dart';
import 'package:improsso/domain/user_domain/entities/pictures_entity.dart';
import 'package:improsso/domain/user_domain/entities/user_entity.dart';
import 'package:improsso/domain/user_domain/failures/failures.dart';
import 'package:improsso/domain/user_domain/failures/user_failures.dart';

abstract class UserRepository {
  Stream<Either<UserFailure, UserEntity>> getAllData();

  Future<Either<Failure, PicturesEntity>> loadProfilePicture();

  Future<Either<Failure, Unit>> deleteProfilePicture();

  Future<Either<Failure, Unit>> pickAndUploadProfilePicture();

  Future<Either<Failure, Unit>> updateUsername(String input);
}
