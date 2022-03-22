import 'package:ecommerce/app/domain/entities/address_entity.dart';
import 'package:ecommerce/app/domain/repositories/address_repository.dart';

class AddressRepositoryImp implements AddressRepository {
  @override
  Future<Map<String, dynamic>> getAddress(String cep) {
    throw UnimplementedError();
  }

  @override
  Future<void> registerAddress(AddressEntity address) {
    throw UnimplementedError();
  }
}
