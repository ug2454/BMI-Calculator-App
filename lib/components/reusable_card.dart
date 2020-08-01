import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({@required this.color, this.cardChild,this.gender});

  final Color color;
  final Widget cardChild;

  final Function gender;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gender,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
