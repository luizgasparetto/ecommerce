// ignore_for_file: unused_field

import 'package:ecommerce/app/domain/services/auth_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:developer' as dev;

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
    } on FirebaseAuthException catch (e, st) {
      if (e.code == 'weak-password') {
        //throw AuthException('This password is too weak');
        dev.log('Senha fraca', error: e, stackTrace: st);
      } else if (e.code == 'email-already-in-use') {
        //throw AuthException('Email already in use');
        dev.log('email em uso', error: e, stackTrace: st);
      } else {
        //throw AuthException('Something went wrong...');
        dev.log('erro desconhecido', error: e, stackTrace: st);
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
        //throw AuthException('User not found...');
        dev.log('USER NOT FOUND');
      } else if (e.code == 'wrong-password') {
        dev.log('WRONG-PASSWORD');
      } else {
        dev.log('DEU ERRO! ERRO DESCONHECIDO');
      }
    }
  }

  @override
  User? getUser() => _user;
}
