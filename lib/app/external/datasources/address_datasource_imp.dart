import 'dart:convert';

import 'package:ecommerce/app/domain/entities/address_entity.dart';
import 'package:ecommerce/app/infra/datasources/address_datasource.dart';
import 'package:http/http.dart';

class AddressDatasourceImp implements AddresDatasource {
  final Client client;

  AddressDatasourceImp(this.client);

  String addresWithCep(String cep) => "viacep.com.br/ws/$cep/json/";

  @override
  Future<Map<String, dynamic>> getAddress(String cep) async {
    final address = await client.get(Uri.parse(addresWithCep(cep)));
    final jsonAddress = jsonDecode(address.body);

    return jsonAddress;
  }

  @override
  Future<void> registerAddress(AddressEntity address) async {
    throw UnimplementedError();
  }
}
