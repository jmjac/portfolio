import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/investments/store/investment_store.dart';
import 'package:provider/provider.dart';

import 'authentication/auth_page.dart';
import 'authentication/store/authentication.dart';
import 'authentication/waiting_page.dart';
import 'home_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthenticationStore>(context);

    return Observer(builder: (_) {
      switch (authentication.status) {
        case AuthStatus.NOT_DETERMINED:
          return WaitingPage();
          break;
        case AuthStatus.NOT_LOGGED_IN:
          return AuthPage();
          break;
        case AuthStatus.LOGGED_IN:
          //Disposes of the reactions and clear errors
          authentication.disposeReactions();
          authentication.error.clear();
          BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
              positions: {"AOGIX": 66.23, "SSBTX": 33.77});
          return MultiProvider(providers: [
            Provider(
              create: (_) => BlackRockStore(portfolio),
            ),
            Provider(
              create: (_) => InvestmentStore(),
            ),
          ], child: HomePage());
          return HomePage();
          break;
        default:
          return WaitingPage();
          break;
      }
    });
  }
}
