import 'package:ecommerce/app/domain/entities/user_entity.dart';
import 'package:ecommerce/core/exports/exports.dart';
import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserUsecase _userUsecase;

  AuthBloc(this._authRepository, this._userUsecase)
      : super(AuthLoadingState()) {
    //
    on<SignUpEvent>((event, emit) async {
      try {
        await _authRepository.signUp(
            email: event.email, password: event.password);
        await _userUsecase.setUserOnFirestore(
          {'name': event.name, 'email': event.email},
        );
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
