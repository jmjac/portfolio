import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/authentication/store/authentication.dart';
import 'package:portfolio/settings/store/settings.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsStore settings = Provider.of<SettingsStore>(context);
    final AuthenticationStore authentication =
        Provider.of<AuthenticationStore>(context);

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                switchSetting("Switch the dark mode", settings.darkMode,
                    settings.toggleDarkMode),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  color: Theme.of(context).buttonColor,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                            title: Text("New main color"),
                            content: MaterialColorPicker(
                                onMainColorChange: (Color color) {
                                  settings.setColor(color);
                                },
                                selectedColor: settings.color,
                                colors: settings.colors,
                                onlyShadeSelection: true,
                                shrinkWrap: true)));
                  },
                  child: Text("New color"),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                      onPressed: () {
                        authentication.signOut();
                        Navigator.pop(context);
                      },
                      child: Text("Signout"),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )),
                ),
              ],
            )));
  }

  //Values passed to this widgets are already observed with ThemeData in main
  Widget switchSetting(String description, bool value, VoidCallback action) {
    return Row(
      children: <Widget>[
        Switch(
            value: value,
            onChanged: (_) {
              action();
            }),
        Text(description)
      ],
    );
  }
}
