import 'package:flutter/material.dart';

class IconPicker extends StatelessWidget {
  static List<IconData> icons = [
    Icons.airplanemode_active,
    Icons.beach_access,
    Icons.child_care,
    Icons.school,
    Icons.computer,
    Icons.attach_money,
    Icons.directions_bike,
    Icons.directions_car,
    Icons.phone_android,
    Icons.restaurant,
    Icons.wb_cloudy,
    Icons.pregnant_woman,
    Icons.card_giftcard
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
