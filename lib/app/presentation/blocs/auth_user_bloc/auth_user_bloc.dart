import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/user_entity.dart';
import 'package:ecommerce/app/presentation/controllers/auth_user_controller.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final AuthUserController _authUserController;

  AuthUserBloc(this._authUserController) : super(AuthUserLoadingState()) {
    //
    on<AuthRegisterUserEvent>((event, emit) async {
      try {
        await _authUserController.register(event.email, event.password);
      } catch (e, st) {
        emit(AuthUserErrorState());
        dev.log('AUTH_REGISTER_USER_ERROR_BLOC', error: e, stackTrace: st);
      }
    });

    on<AuthLoginUserEvent>((event, emit) async {
      try {
        await _authUserController.login(event.email, event.password);
      } catch (e, st) {
        emit(AuthUserErrorState());
        dev.log('AUTH_LOGIN_USER_ERROR_BLOC', error: e, stackTrace: st);
      }
    });
  }
}
