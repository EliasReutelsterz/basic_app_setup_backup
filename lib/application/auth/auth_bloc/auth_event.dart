part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignOutPressedEvent extends AuthEvent {
  final dynamic context;
  SignOutPressedEvent({required this.context});
}

class DeleteAccountPressedEvent extends AuthEvent {
  final dynamic context;
  DeleteAccountPressedEvent({required this.context});
}

class AuthCheckRequestedEvent extends AuthEvent {}
