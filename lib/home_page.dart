

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/store/authentication.dart';
import 'black_rock/black_rock_api_portfolio.dart';
import 'goals/store/goalStore.dart';

class HomePage extends StatelessWidget {
    static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];
  @override
  Widget build(BuildContext context) {
    final AuthenticationStore authentication =
        Provider.of<AuthenticationStore>(context);
    final GoalStore goal =
        Provider.of<GoalStore>(context);
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
      
      body: DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: kIcons),
                ),
              ),
              RaisedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    )
      // Center(
      //   child: Column(children: <Widget>[
      //     Text("Welcome ${authentication.email}"),
      //     RaisedButton(
      //       onPressed: () {

      //       },
      //       child: Text("Make api request"),
      //     ),
      //     // addGoal(goal)
      //   ]),
      //   //Observer(builder: (_)=>ListView.builder(itemBuilder: null, itemCount: 0,))
      // ),
    );
  }

  // Widget addGoal(GoalStore goal, BuildContext context) {
  //   return RaisedButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(100),
  //       ),
  //       color: Colors.red,
  //       textColor: Colors.white,
  //       elevation: 16,
  //       padding: EdgeInsets.all(4.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Padding(
  //               padding: EdgeInsets.only(left: 8.0),
  //               child: Text("Set Goal"))
  //         ],
  //       )
        // onPressed:
  // }


  // _addGoal() {
  //    showDialog(
  //      context: context,
  //      builder: (BuildContext context) {
  //        return AlertDialog(
  //          title: Text('New todo'),
  //        );
  //      },
  //    );
  //  }



}
