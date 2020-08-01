import 'package:flutter/material.dart';
import '../constants.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({this.icon, this.genderText});

  final IconData icon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText, style: kLabelTextStyle),
      ],
    );
  }
}
