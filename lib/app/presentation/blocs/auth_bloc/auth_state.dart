part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState {}

class UnAuthenticatedState extends AuthState {}

class LoadingState extends AuthState {}
