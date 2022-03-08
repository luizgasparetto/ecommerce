import 'package:ecommerce/app/domain/entities/users_entity.dart';

abstract class GetUsersUseCase {
  Future<List<UserEntity>> call();
}
