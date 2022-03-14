import 'package:ecommerce/app/domain/repositories/user_repository.dart';
import 'package:ecommerce/app/infra/datasources/user_datasource.dart';
import 'package:ecommerce/app/infra/dtos/user_dto.dart';

class UserRepositoryImp implements UserRepository {
  final UserDatasource _userDatasource;

  UserRepositoryImp(UserDatasource userDatasource)
      : _userDatasource = userDatasource;

  @override
  Future<UserDTO> getUser() async {
    final userFirestore = await _userDatasource.getUser();
    return UserDTO.fromMap(userFirestore);
  }

  @override
  Future<void> setUserOnFirestore(Map<String, dynamic> data) async {
    await _userDatasource.setUserOnFirestore(data);
  }
}
