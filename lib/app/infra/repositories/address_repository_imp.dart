import 'package:ecommerce/app/domain/entities/address_entity.dart';
import 'package:ecommerce/app/domain/repositories/address_repository.dart';
import 'package:ecommerce/app/infra/datasources/address_datasource.dart';
import 'package:ecommerce/app/infra/dtos/address_dto.dart';

class AddressRepositoryImp implements AddressRepository {
  final AddressDatasource _addressDatasource;

  AddressRepositoryImp(this._addressDatasource);

  @override
  Future<AddressEntity> getAddressFromCEP(String cep) async {
    final addressJson = await _addressDatasource.getAddressFromCEP(cep);
    return AddressDTO.fromMap(addressJson);
  }

  @override
  Future<void> registerAddress(Map<String, dynamic> address) async {
    return await _addressDatasource.registerAddress(address);
  }
}
