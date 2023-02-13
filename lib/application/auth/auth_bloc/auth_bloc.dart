import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:improsso/domain/auth_domain/repositories/auth_repository.dart';
import 'package:improsso/routes/router.gr.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignOutPressedEvent>((event, emit) async {
      await authRepository.logOut(context: event.context);
      emit(AuthStateUnauthentificated());
    });

    on<AuthCheckRequestedEvent>((event, emit) async {
      final userOption = authRepository.getSignedInUser();

      userOption.fold(() => emit(AuthStateUnauthentificated()),
          (a) => emit(AuthStateAuthentificated()));
    });

    on<DeleteAccountPressedEvent>((event, emit) async {
      User user = FirebaseAuth.instance.currentUser!;
      Future.delayed(Duration(seconds: 1));
      FirebaseFirestore.instance.collection("users").doc(user.uid).delete();
      Future.delayed(Duration(seconds: 1));
      user.delete();
      Future.delayed(Duration(milliseconds: 500));
      AutoRouter.of(event.context).replace(const LoginPageRoute());
    });
  }
}
