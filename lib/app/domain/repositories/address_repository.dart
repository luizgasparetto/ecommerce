import 'package:ecommerce/app/domain/entities/address_entity.dart';

abstract class AddressRepository {
  Future<AddressEntity> getAddressFromCEP(String cep);
  Future<void> registerAddress(Map<String, dynamic> address);
}
