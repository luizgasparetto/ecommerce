import 'package:ecommerce/app/domain/entities/users_entity.dart';

abstract class GetUserRepository {
  Future<List<UserEntity>> call();
}
