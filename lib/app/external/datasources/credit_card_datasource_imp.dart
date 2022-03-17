import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/infra/datasources/credit_card_datasource.dart';
import 'package:ecommerce/core/exports/exports.dart';

class CreditCardDatasourceImp implements CreditCardDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  CreditCardDatasourceImp({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<List<Map<String, dynamic>>> getCreditCards() async {
    final user = await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return user['creditCards'];
  }

  @override
  Future<void> addCreditCard(Map<String, dynamic> creditCard) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'creditCards': FieldValue.arrayUnion([creditCard]),
    });
  }

  @override
  Future<void> removeCreditCard(Map<String, dynamic> creditCard) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'creditCards': FieldValue.arrayRemove([creditCard]),
    });
  }
}
