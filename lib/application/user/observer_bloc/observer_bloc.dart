import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:improsso/domain/user_domain/entities/user_entity.dart';
import 'package:improsso/domain/user_domain/failures/user_failures.dart';
import 'package:improsso/infrastructure/repositories/user_repository_impl.dart';
part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  StreamSubscription<Either<UserFailure, UserEntity>>? _userdataStreamSub;

  ObserverBloc() : super(ObserverInitial()) {
    on<ObserverveAllEvent>((event, emit) async {
      UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();
      await _userdataStreamSub?.cancel();
      _userdataStreamSub = await userRepositoryImpl
          .getAllData()
          .listen((failureOrUserEntity) async {
        return add(
            UserdataUpdatedEvent(failureOrUserEntity: failureOrUserEntity));
      });
    });

    on<UserdataUpdatedEvent>((event, emit) {
      event.failureOrUserEntity.fold(
          (failure) => emit(ObserverFailure(
              failure: "Ups, something gone wrong. Please try again!")),
          (userEntity) => emit(ObserverSuccess(userEntity: userEntity)));
    });
  }
}
