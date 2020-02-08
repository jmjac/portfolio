import 'package:flutter/material.dart';
import 'package:portfolio/authentication/store/authentication.dart';
import 'package:provider/provider.dart';

class WaitingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthenticationStore>(context).determineStatus();
    return Container();
  }
}
