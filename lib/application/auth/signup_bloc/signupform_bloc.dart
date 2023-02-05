import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:improsso/domain/auth_domain/failures/auth_failures.dart';
import 'package:improsso/domain/auth_domain/repositories/auth_repository.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  final AuthRepository authRepository;
  SignupformBloc({required this.authRepository})
      : super(SignupformState(
            isSubmitting: false,
            showValidationMessages: false,
            authFailureOrSuccessOption: none())) {
    on<RegisterWithEmailAndUsernameAndPasswordPressed>((event, emit) async {
      if (event.email == null ||
          event.username == null ||
          event.password == null) {
        emit(state.copyWith(
          isSubmitting: false,
          showValidationMessages: true,
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: true,
          showValidationMessages: false,
          authFailureOrSuccessOption: none(),
        ));
        await authRepository
            .registerWithEmailAndPassword(
                email: event.email!,
                username: event.username!,
                password: event.password!)
            .then((failureOrSuccess) {
          emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: optionOf(failureOrSuccess)));
        });
      }
    });
    on<LoginWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(state.copyWith(
          isSubmitting: true,
          showValidationMessages: false,
          authFailureOrSuccessOption: none(),
        ));
        final failureOrSuccess = await authRepository.loginWithEmailAndPassword(
            email: event.email!, password: event.password!);

        emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });
  }
}
