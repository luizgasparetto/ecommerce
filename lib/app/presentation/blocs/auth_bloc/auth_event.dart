part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  final BuildContext context;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [name, email, password, context];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  final BuildContext context;

  const SignInEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object> get props => [email, password, context];
}

class LogoutEvent extends AuthEvent {}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class GetUserEvent extends AuthEvent {}
