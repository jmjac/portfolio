import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/store/authentication.dart';
import 'black_rock/black_rock_api_portfolio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationStore authentication =
        Provider.of<AuthenticationStore>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, "home/settings");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text("Welcome ${authentication.email}"),
          RaisedButton(
            onPressed: () {

            },
            child: Text("Make api request"),
          )
        ]),
        //Observer(builder: (_)=>ListView.builder(itemBuilder: null, itemCount: 0,))
      ),
    );
  }
}
