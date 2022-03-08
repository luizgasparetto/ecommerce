import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/users_entity.dart';
import 'package:ecommerce/app/domain/usecases/get_users/get_users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final GetUsersUseCase _getUsersUseCase;

  GetUsersBloc(this._getUsersUseCase) : super(GetUsersLoadingState()) {
    /////
    on<GetUsersEvent>((event, emit) async {
      try {
        final usersList = await _getUsersUseCase();
        emit(GetUsersLoadedState(usersList));
      } catch (e) {
        emit(GetUsersErrorState());
      }
    });
  }
}
