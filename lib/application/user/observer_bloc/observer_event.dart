part of 'observer_bloc.dart';

abstract class ObserverEvent {}

class ObserverveAllEvent extends ObserverEvent {}

class UserdataUpdatedEvent extends ObserverEvent {
  final Either<UserFailure, UserEntity> failureOrUserEntity;
  UserdataUpdatedEvent({required this.failureOrUserEntity});
}
