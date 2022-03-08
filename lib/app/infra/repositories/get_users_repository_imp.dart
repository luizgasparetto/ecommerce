import 'package:ecommerce/app/domain/entities/users_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_users_repository.dart';
import 'package:ecommerce/app/infra/datasources/get_users_datasource.dart';
import 'package:ecommerce/app/infra/dtos/user_dto.dart';

class GetUsersRepositoryImp implements GetUserRepository {
  final GetUsersDatasource _getUsersDatasource;

  GetUsersRepositoryImp(this._getUsersDatasource);

  @override
  Future<List<UserDTO>> call() async {
    final firestoreUserList = await _getUsersDatasource.getUsers();
    return firestoreUserList.docs.map((user) => UserDTO.fromMap(user.data())).toList();
  }
}
