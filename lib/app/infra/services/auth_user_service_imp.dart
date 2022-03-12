// ignore_for_file: unused_field

import 'package:ecommerce/app/domain/services/auth_user_service.dart';
import 'package:ecommerce/app/infra/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserServiceImp implements AuthUserService {
  final FirebaseAuth _auth;
  User? _user;

  AuthUserServiceImp(this._auth) {
    authCheck();
  }

  @override
  void authCheck() {
    _auth.authStateChanges().listen((User? user) {
      _user = (user == null) ? null : user;
    });
  }

  @override
  Future<void> register(String email, String passw) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: passw);
      _user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email already in use');
      } else {
        throw AuthException('Something went wrong...');
      }
    }
  }

  @override
  Future<void> login(String email, String passw) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: passw);
      _user = _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('User not found...');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password! Try again');
      } else {
        throw AuthException('Something went wrong...');
      }
    }
  }
}
