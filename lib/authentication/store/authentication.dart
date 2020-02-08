import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../base_auth.dart';
import 'authentication_state_error.dart';

part 'authentication.g.dart';



class AuthenticationStore extends _AuthenticationStore
    with _$AuthenticationStore {
  AuthenticationStore({@required BaseAuth auth}) : super(auth: auth);
}

enum AuthStatus { NOT_DETERMINED, NOT_LOGGED_IN, LOGGED_IN }

abstract class _AuthenticationStore with Store {
  final BaseAuth _auth;
  final AuthenticationStateError error = AuthenticationStateError();

  _AuthenticationStore({@required BaseAuth auth}) : _auth = auth;

  @observable
  AuthStatus status = AuthStatus.NOT_DETERMINED;

  @observable
  bool isRegistrationForm = false;

  @observable
  String email;

  @observable
  String password;

  @observable
  String passwordRepeat;

  @computed
  bool get canLogin => !error.hasErrors;

  @observable
  bool isUserCheckPending = false;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    print("$AuthenticationStore : Setup reactions");
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => passwordRepeat, validatePasswordRepeat)
    ];
  }

  @action
  void validateEmail(String value) {
    error.email = (value == null || value.isEmpty || value == "")
        ? "Email can't be empty"
        : null;
    if (isRegistrationForm && error.email == null && !value.contains("@"))
      error.email = "It's not a valid email";
  }

  @action
  void validatePassword(String value) {
    error.password = (value == null || value.isEmpty) ? "Can't be empty" : null;
  }

  @action
  void validatePasswordRepeat(String value) {
    if (isRegistrationForm) {
      error.passwordRepeat = value != password ? "Passwords don't match" : null;
    }
  }

  void disposeReactions() {
    if (_disposers != null) {
      print("$AuthenticationStore : Disposed of the reactions");
      for (final d in _disposers) {
        d();
      }
      _disposers = null;
    }
  }

  @action
  Future<void> validateAndSubmit() async {
    isUserCheckPending = true;
    error.clear();

    validateEmail(email);
    validatePassword(password);
    if (isRegistrationForm) {
      validatePasswordRepeat(passwordRepeat);
    }

    if (canLogin) {
      isRegistrationForm ? await signUp() : await signInWithCredentials();
    }
    isUserCheckPending = false;
  }

  @action
  void changeForm() {
    isRegistrationForm = !isRegistrationForm;
    error.clear();
  }

  @action
  Future<void> signInWithCredentials() async {
    try {
      await _auth.signInWithCredentials(email, password);
      status = AuthStatus.LOGGED_IN;
      error.clear();
    } catch (e) {
      error.authenticate = e.message;
    }
  }

  @action
  Future<void> signUp() async {
    try {
      await _auth.signUp(email, password);
      status = AuthStatus.LOGGED_IN;
      error.clear();
    } catch (e) {
      error.authenticate = e.message;
    }
  }

  @action
  Future<void> signInWithGoogle() async {
    try {
      FirebaseUser user = await _auth.signInWithGoogle();

      if (user != null) {
        status = AuthStatus.LOGGED_IN;
        email = user.email;
      }
    } catch (_) {
      error.authenticate = "You cancelled the Google SignIn";
      print("$AuthenticationStore : The user cancelled google signin");
    }
  }

  @action
  Future<void> determineStatus() async {
    bool signedIn = await _auth.isSignedIn();
    if (signedIn) {
      email = await _auth.getUserEmail();
    }
    status = signedIn ? AuthStatus.LOGGED_IN : AuthStatus.NOT_LOGGED_IN;
  }

  @action
  void signOut() {
    email = null;
    password = null;
    passwordRepeat = null;
    error.clear();
    _auth.signOut();
    status = AuthStatus.NOT_LOGGED_IN;
  }

  BaseAuth getAuth() {
    return _auth;
  }
}
