import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetProductsDataSource {
  Future<QuerySnapshot<Map<String, dynamic>>> getProductList();
}
