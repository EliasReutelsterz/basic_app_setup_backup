part of 'signupform_bloc.dart';

abstract class SignupformEvent {}

class RegisterWithEmailAndUsernameAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? username;
  final String? password;
  RegisterWithEmailAndUsernameAndPasswordPressed(
      {required this.email, required this.username, required this.password});
}

class LoginWithEmailAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? password;
  LoginWithEmailAndPasswordPressed(
      {required this.email, required this.password});
}
