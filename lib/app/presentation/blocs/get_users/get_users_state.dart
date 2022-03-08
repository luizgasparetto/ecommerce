part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

class GetUsersLoadingState extends GetUsersState {}

class GetUsersLoadedState extends GetUsersState {
  final List<UserEntity> usersList;

  const GetUsersLoadedState(this.usersList);

  @override
  List<Object> get props => [usersList];
}

class GetUsersErrorState extends GetUsersState {}
