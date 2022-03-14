import 'package:ecommerce/app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser();
  Future<void> setUserOnFirestore(Map<String, dynamic> data);
}
