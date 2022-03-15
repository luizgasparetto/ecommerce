part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {}

class AuthGetUserState extends AuthState {
  final UserEntity user;

  const AuthGetUserState({required this.user});

  @override
  List<Object> get props => [user];
}
