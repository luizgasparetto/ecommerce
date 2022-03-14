import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/user_entity.dart';
import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/domain/usecases/user_usecase/user_usecase.dart';
import 'package:ecommerce/app/infra/exceptions/logout_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_in_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_up_exception.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserUsecase _userUsecase;

  AuthBloc(this._authRepository, this._userUsecase) : super(LoadingState()) {
    //
    on<SignUpEvent>((event, emit) async {
      try {
        await _authRepository.signUp(
            email: event.email, password: event.password);
        emit(AuthenticatedState());
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
        emit(AuthenticatedState());
      } catch (e) {
        throw SignInException();
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await _authRepository.logOut();
        emit(UnAuthenticatedState());
      } catch (e) {
        throw LogOutException();
      }
    });

    on<GetUserEvent>((event, emit) async {
      try {
        final user = await _userUsecase.getUser();
        emit(GetUserState(user: user));
      } catch (_) {}
    });
  }
}
