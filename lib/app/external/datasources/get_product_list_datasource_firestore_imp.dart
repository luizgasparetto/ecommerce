import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';

class GetProductListDatasourceFirestoreImp implements GetProductsDataSource {
  final FirebaseFirestore _fireStoreInstance;

  GetProductListDatasourceFirestoreImp(this._fireStoreInstance);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getProductList() async {
    return await _fireStoreInstance.collection('products').get();
  }
}
