part of 'user.cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  dynamic result;
  UserLoadedState(this.result);
  @override
  List<Object> get props => [result];
}

class UserUpdatedState extends UserState {
  dynamic result;
  UserUpdatedState(this.result);
  @override
  List<Object> get props => [result];
}

class UserDeletedState extends UserState {
  dynamic result;
  UserDeletedState(this.result);
  @override
  List<Object> get props => [result];
}

class UserErrorState extends UserState {
  Object error;
  UserErrorState(this.error);
  @override
  List<Object> get props => [error];
}
