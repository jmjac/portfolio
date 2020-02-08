import 'package:flutter/material.dart';
import 'package:portfolio/black_rock/black_rock_page.dart';
import 'package:portfolio/investments/investment_page.dart';
import 'package:portfolio/settings/settings_page.dart';
import 'package:provider/provider.dart';
import 'authentication/store/authentication.dart';
import 'black_rock/black_rock_api_portfolio.dart';
import 'goals/goal_page.dart';
import 'goals/store/goalStore.dart';

class HomePage extends StatelessWidget {
  final pages = <StatelessWidget>[
    GoalPage(),
    InvestmentPage(),
    BlackRockPage()
  ];

  @override
  Widget build(BuildContext context) {
    final AuthenticationStore authentication =
        Provider.of<AuthenticationStore>(context);
    final GoalStore goal = Provider.of<GoalStore>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("PortfoliQ"),
          centerTitle: true,
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
          length: pages.length,
          child: Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: IconTheme(
                      data: IconThemeData(
                        size: 128.0,
                        color: Theme.of(context).accentColor,
                      ),
                      child: TabBarView(children: pages),
                    ),
                  ),
                  TabPageSelector(
                    indicatorSize: 8.0,
                    color: Colors.grey,
                    selectedColor: Colors.black,

                  ),
//                  RaisedButton(
//                    child: Text('SKIP'),
//                    onPressed: () {
//                      final TabController controller =
//                          DefaultTabController.of(context);
//                      if (!controller.indexIsChanging) {
//                        controller.animateTo(pages.length - 1);
//                      }
//                    },
//                  )
                ],
              ),
            ),
          ),
        ));
  }
}
