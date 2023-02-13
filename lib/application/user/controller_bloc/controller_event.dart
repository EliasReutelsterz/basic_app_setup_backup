part of 'controller_bloc.dart';

abstract class ControllerEvent {}

class UpdateUsernameEvent extends ControllerEvent {
  final dynamic context;
  final String input;
  UpdateUsernameEvent({required this.context, required this.input});
}
