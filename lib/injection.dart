import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:improsso/application/auth/auth_bloc/auth_bloc.dart';
import 'package:improsso/application/auth/signup_bloc/signupform_bloc.dart';
import 'package:improsso/domain/auth_domain/repositories/auth_repository.dart';
import 'package:improsso/infrastructure/repositories/auth_repository_impl.dart';

final sl = GetIt.I; // sl == service locator

Future<void> init() async {
  //? ############## Auth ################
  //! state management
  sl.registerFactory(() => SignupformBloc(authRepository: sl()));

  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  //! repos
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //! extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);
}
