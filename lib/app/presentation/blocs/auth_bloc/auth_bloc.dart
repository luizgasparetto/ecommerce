import 'package:ecommerce/app/domain/entities/user_entity.dart';
import 'package:ecommerce/app/domain/usecases/auth_usecase/auth_usecase.dart';
import 'package:ecommerce/core/exports/exports.dart';
import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUsecase;
  final UserUsecase _userUsecase;

  AuthBloc(this._authUsecase, this._userUsecase) : super(AuthLoadingState()) {
    //
    on<SignUpEvent>((event, emit) async {
      await _authUsecase.signUp(
        email: event.email,
        password: event.password,
        context: event.context,
      );

      await _userUsecase.setUserOnFirestore(
        {'name': event.name, 'email': event.email},
      );
    });

    on<SignInEvent>((event, emit) async {
      await _authUsecase.signIn(
          email: event.email, password: event.password, context: event.context);
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await _authUsecase.logOut();
      } catch (e) {
        throw Exception();
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      try {
        await _authUsecase.resetPassword(event.email);
      } catch (e) {
        throw Exception();
      }
    });

    on<GetUserEvent>((event, emit) async {
      try {
        final user = await _userUsecase.getUser();
        emit(AuthGetUserState(user: user));
      } catch (e, st) {
        dev.log('ERRO AO CARREGAR O USUÁRIO', error: e, stackTrace: st);
      }
    });
  }
}
