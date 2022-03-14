import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce/app/infra/datasources/user_datasource.dart';

class UserDatasourceImp implements UserDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  UserDatasourceImp({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<Map<String, dynamic>?> getUser() async {
    final user = await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return user.data();
  }

  @override
  Future<void> setUserOnFirestore(Map<String, dynamic> data) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'name': data['name'],
      'email': data['email'],
      'cartItems': data['cartItens'],
    });
  }
}
