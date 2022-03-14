// ignore_for_file: override_on_non_overriding_member

import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/infra/exceptions/sign_in_exception.dart';
import 'package:ecommerce/app/infra/exceptions/sign_up_exception.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/login_page.dart';
import 'package:ecommerce/app/presentation/ui/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _auth;
  @override
  User? currentUser;

  AuthRepositoryImp(FirebaseAuth? auth) : _auth = auth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user => _auth.authStateChanges().map((firebaseUser) {
        currentUser = (firebaseUser == null) ? null : firebaseUser;
        return currentUser;
      });

  @override
  Widget getLandingPage(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        return snapshot.hasData ? const HomePage() : const LoginPage();
      },
    );
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SignUpException.fromCode(e.code);
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw SignInException.fromCode(e.code);
    }
  }

  @override
  Future<void> logOut() async => await _auth.signOut();
}
