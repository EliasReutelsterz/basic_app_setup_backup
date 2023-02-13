part of 'observer_bloc.dart';

abstract class ObserverState {}

class ObserverLoading extends ObserverState {}

class ObserverSuccess extends ObserverState {
  final UserEntity userEntity;
  ObserverSuccess({required this.userEntity});
}

class ObserverFailure extends ObserverState {
  final String failure;
  ObserverFailure({required this.failure});
}

class ObserverInitial extends ObserverState {}
