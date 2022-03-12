part of 'auth_user_bloc.dart';

abstract class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object> get props => [];
}

class AuthUserLoadingState extends AuthUserState {}

class AuthUserLoadedState extends AuthUserState {
  final UserEntity user;

  const AuthUserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class AuthUserErrorState extends AuthUserState {}
