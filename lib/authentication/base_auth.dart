import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<FirebaseUser> signInWithCredentials(String email, String password);

  Future<FirebaseUser> signInWithGoogle();

  Future<String> signUp(String email, String password);

  Future<bool> isSignedIn();

  Future<String> getUserEmail();

  Future<void> signOut();

  Future<void> sendEmailVerification();

  Future<bool> isEmailVerified();
}
