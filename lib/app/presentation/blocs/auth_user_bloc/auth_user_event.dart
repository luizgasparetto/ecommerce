part of 'auth_user_bloc.dart';

abstract class AuthUserEvent extends Equatable {
  const AuthUserEvent();

  @override
  List<Object> get props => [];
}

class AuthRegisterUserEvent extends AuthUserEvent {
  final String email;
  final String password;

  const AuthRegisterUserEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthLoginUserEvent extends AuthUserEvent {
  final String email;
  final String password;

  const AuthLoginUserEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
