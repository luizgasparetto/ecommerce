import 'package:ecommerce/app/domain/entities/users_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_users_repository.dart';
import 'package:ecommerce/app/domain/usecases/get_users/get_users_usecase.dart';

class GetUsersUsecaseImp implements GetUsersUseCase {
  final GetUserRepository _getUserRepository;

  GetUsersUsecaseImp(this._getUserRepository);

  @override
  Future<List<UserEntity>> call() async => await _getUserRepository();
}
