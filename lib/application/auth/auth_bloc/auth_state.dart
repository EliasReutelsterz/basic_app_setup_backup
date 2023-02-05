part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthStateAuthentificated extends AuthState {}

class AuthStateUnauthentificated extends AuthState {}
