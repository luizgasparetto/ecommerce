import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/app/infra/datasources/get_users_datasource.dart';

class GetUsersDatasourcesFirestoreImp implements GetUsersDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetUsersDatasourcesFirestoreImp(this._firebaseFirestore);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getUsers() async {
    return await _firebaseFirestore.collection('users').get();
  }
}
