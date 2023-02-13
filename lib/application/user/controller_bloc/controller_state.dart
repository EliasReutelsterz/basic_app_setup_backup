part of 'controller_bloc.dart';

abstract class ControllerState {}

class ControllerInitial extends ControllerState {}

class ControllerUpdateUsernameSuccess extends ControllerState {}

class ControllerUpdateUsernameFailure extends ControllerState {}
