part of 'signupform_bloc.dart';

class SignupformState {
  final bool isSubmitting;
  final bool showValidationMessages;
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  SignupformState(
      {required this.isSubmitting,
      required this.showValidationMessages,
      required this.authFailureOrSuccessOption});

  SignupformState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) {
    return SignupformState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
      authFailureOrSuccessOption:
          authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
    );
  }
}
