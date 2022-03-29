import 'dart:convert';

import 'package:ecommerce/app/infra/datasources/address_datasource.dart';
import 'package:ecommerce/core/exports/exports.dart';
import 'package:http/http.dart';

class AddressDatasourceImp implements AddressDatasource {
  final Client client;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AddressDatasourceImp({
    required this.client,
    required this.firebaseAuth,
    required this.firestore,
  });

  String addresWithCep(String cep) => "viacep.com.br/ws/$cep/json/";

  @override
  Future<Map<String, dynamic>> getAddressFromCEP(String cep) async {
    final address = await client.get(Uri.parse(addresWithCep(cep)));
    final jsonAddress = jsonDecode(address.body);

    return jsonAddress;
  }

  @override
  Future<void> registerAddress(Map<String, dynamic> address) async {
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
      "address": FieldValue.arrayUnion([address]),
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getAddressList() async {
    final user = await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    return user['address'];
  }
}
