import 'package:ecommerce/app/infra/datasources/cart_datasource.dart';
import 'package:ecommerce/core/exports/exports.dart';

class CartDatasourceImp implements CartDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  CartDatasourceImp({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<List<dynamic>> getCartItems() async {
    final user = await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return user.get('cartProducts') ?? <ProductEntity>[];
  }

  @override
  Future<void> addCartItem(Map<String, dynamic> product) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'cartProducts': FieldValue.arrayUnion([product]),
    });
  }

  @override
  Future<void> deleteCartItem(Map<String, dynamic> product) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'cartProducts': FieldValue.arrayRemove([product]),
    });
  }
}
