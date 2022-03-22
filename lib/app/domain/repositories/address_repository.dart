import 'package:ecommerce/app/domain/entities/address_entity.dart';

abstract class AddressRepository {
  Future<Map<String, dynamic>> getAddress(String cep);
  Future<void> registerAddress(AddressEntity address);
}
