import 'package:ecommerce/app/domain/entities/address_entity.dart';

abstract class AddresDatasource {
  Future<Map<String, dynamic>> getAddress(String cep);
  Future<void> registerAddress(AddressEntity address);
}
