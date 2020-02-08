import 'package:mobx/mobx.dart';

part 'authentication_state_error.g.dart';

class AuthenticationStateError = _AuthenticationStateError
    with _$AuthenticationStateError;

abstract class _AuthenticationStateError with Store {
  @observable
  String email;

  @observable
  String password;

  @observable
  String passwordRepeat;

  @observable
  String authenticate;

  @computed
  bool get hasErrors =>
      email != null || password != null || passwordRepeat != null;

  @action
  void clear() {
    email = null;
    password = null;
    passwordRepeat = null;
    authenticate = null;
  }
}
