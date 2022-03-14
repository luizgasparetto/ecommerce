import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/infra/exceptions/logout_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_in_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_up_exception.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(LoadingState()) {
    //
    on<SignUpEvent>((event, emit) async {
      try {
        await _authRepository.signUp(
            email: event.email, password: event.password);
      } catch (e) {
        throw SignUpException();
      }
    });

    on<SignInEvent>((event, emit) async {
      try {
        await _authRepository.signIn(
            email: event.email, password: event.password);
      } catch (e) {
        throw SignInException();
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await _authRepository.logOut();
      } catch (e) {
        throw LogOutException();
      }
    });
  }
}
