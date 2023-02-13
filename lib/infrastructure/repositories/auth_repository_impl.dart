import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:improsso/domain/auth_domain/entities/user.dart';
import 'package:improsso/domain/auth_domain/failures/auth_failures.dart';
import 'package:improsso/domain/auth_domain/repositories/auth_repository.dart';
import 'package:improsso/domain/auth_domain/usecases/check_if_username_in_use.dart';
import 'package:improsso/infrastructure/extensions/firebase_user_mapper.dart';
import 'package:improsso/routes/router.gr.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email,
      required String username,
      required String password}) async {
    try {
      bool getOutOfInfiniteLoop = false;
      bool successfull = true;
      await CheckIfUsernameInUse()
          .checkIfUsernameInUse(username)
          .then((usernameAlreadyExists) async {
        if (usernameAlreadyExists) {
          successfull = false;
        } else {
          await firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            FirebaseFirestore.instance
                .collection("users")
                .doc(value.user!.uid)
                .set({
              "email": value.user!.email,
              "id": value.user!.uid,
              "username": username,
            });
          });
        }
      }).then((value) {
        getOutOfInfiniteLoop = true;
      });
      while (!getOutOfInfiniteLoop) {
        Future.delayed(Duration(milliseconds: 10));
      }
      if (successfull) {
        return right(unit);
      } else {
        return left(UsernameAlreadyInUseFailure());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(EmailAlreadyInUseFailure());
      } else {
        return left(ServerFailure());
      }
    } on Exception {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(InvalidEmailAndPasswordCombinationFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<void> logOut({required dynamic context}) {
    AutoRouter.of(context).replace(const LoginPageRoute());
    return Future.wait([
      firebaseAuth.signOut(),
    ]);
  }

  @override
  Option<CustomUser> getSignedInUser() =>
      optionOf(firebaseAuth.currentUser?.toDomain());
}
