part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class LoadingState extends AuthState {}

class CreatedUserState extends AuthState {
  final UserEntity user;

  const CreatedUserState({required this.user});

  @override
  List<Object> get props => [user];
}

class GetUserState extends AuthState {
  final UserEntity user;

  const GetUserState({required this.user});

  @override
  List<Object> get props => [user];
}
