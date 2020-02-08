import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/authentication/store/authentication.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final focus = FocusNode();
  final focusRepeat = FocusNode();

  @override
  Widget build(BuildContext context) {
    final AuthenticationStore authentication =
        Provider.of<AuthenticationStore>(context);
    authentication.setupValidations();

    return Scaffold(
      body: Center(
          child: Form(
        child: ListView(
          padding: EdgeInsets.all(40.0),
          children: [
            logo(),
            Observer(
              builder: (_) => TextFormField(
                onChanged: (value) => authentication.email = value,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus);
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    icon: Icon(Icons.email),
                    errorText: authentication.error.email),
              ),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: (value) => authentication.password = value,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusRepeat);
                },
                focusNode: focus,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Your password',
                    icon: Icon(Icons.lock_outline),
                    errorText: authentication.error.password),
              ),
            ),
            Observer(
                builder: (_) => authentication.isRegistrationForm
                    ? TextFormField(
                        onChanged: (value) =>
                            authentication.passwordRepeat = value,
                        focusNode: focusRepeat,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Confrim password',
                            hintText: 'Your password',
                            icon: Icon(Icons.lock_outline),
                            errorText: authentication.error.passwordRepeat))
                    : Container(height: 0, width: 0)),
            Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Observer(
                    builder: (_) => AnimatedOpacity(
                        child: const LinearProgressIndicator(),
                        duration: const Duration(milliseconds: 1000),
                        opacity: authentication.isUserCheckPending ? 1 : 0))),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Observer(
                    builder: (_) => authentication.error.authenticate != null
                        ? Text(
                            "${authentication.error.authenticate}",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container())),
            googleSignIn(authentication),
            Observer(
                builder: (_) => RaisedButton(
                      elevation: 16,
                      child: Text(authentication.isRegistrationForm
                          ? "Create an acount"
                          : "Login"),
                      onPressed: !authentication.isUserCheckPending
                          ? authentication.validateAndSubmit
                          : null,
                      disabledColor: Theme.of(context).backgroundColor,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                    )),
            Observer(
                builder: (_) => FlatButton(
                      child: Text(authentication.isRegistrationForm
                          ? "Already have an account?"
                          : "Create an account"),
                      splashColor: Theme.of(context).primaryColor,
                      onPressed: authentication.changeForm,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                    )),
          ],
        ),
      )),
    );
  }

  Widget logo() {
    return Hero(
      tag: 'logo',
      child: CircleAvatar(
        child: Text("LOGO"),
        minRadius: 100,
      ),
    );
  }



  Widget googleSignIn(AuthenticationStore authentication) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        color: Colors.red,
        textColor: Colors.white,
        elevation: 16,
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Sign in with Google"))
          ],
        ),
        onPressed: authentication.signInWithGoogle);
  }
}
