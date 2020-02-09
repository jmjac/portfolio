import 'package:flutter/material.dart';

class IconPicker extends StatelessWidget {
  static List<IconData> icons = [
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    // all the icons you want to include
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: <Widget>[
        for (var icon in icons)
          GestureDetector(
            onTap: () => Navigator.pop(context, icon),
            child: Icon(icon),
          )
      ],
    );
  }
}