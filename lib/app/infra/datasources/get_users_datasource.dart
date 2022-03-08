import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetUsersDatasource {
  Future<QuerySnapshot<Map<String, dynamic>>> getUsers();
}
