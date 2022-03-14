import 'package:ecommerce/app/domain/entities/user_entity.dart';
import 'package:ecommerce/app/domain/repositories/user_repository.dart';
import 'package:ecommerce/app/domain/usecases/user_usecase/user_usecase.dart';

class UserUsecaseImp implements UserUsecase {
  final UserRepository userRepository;

  UserUsecaseImp({required this.userRepository});

  @override
  Future<UserEntity> getUser() async {
    return await userRepository.getUser();
  }

  @override
  Future<void> setUserOnFirestore(Map<String, dynamic> data) async {
    await userRepository.setUserOnFirestore(data);
  }
}
