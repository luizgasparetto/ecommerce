import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> logOut();
  Widget getLandingPage(BuildContext context);
  Stream<User?> get user;
  User? getUser();
}
