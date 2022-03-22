import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> logOut();
  Future<void> resetPassword(String email);
  Widget getLandingPage(BuildContext context);
}
