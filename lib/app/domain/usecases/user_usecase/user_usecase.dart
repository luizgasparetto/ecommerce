import 'package:ecommerce/app/domain/entities/user_entity.dart';

abstract class UserUsecase {
  Future<UserEntity> getUser();
  Future<void> setUserOnFirestore(Map<String, dynamic> data);
}
