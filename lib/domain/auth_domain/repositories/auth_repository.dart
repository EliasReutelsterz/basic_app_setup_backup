import 'package:dartz/dartz.dart';
import 'package:improsso/domain/auth_domain/entities/user.dart';
import 'package:improsso/domain/auth_domain/failures/auth_failures.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email,
      required String username,
      required String password});
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<void> logOut({required dynamic context});

  Option<CustomUser> getSignedInUser();
}
