import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmiResult,
      @required this.bmiValue,
      @required this.bmiRangeText,
      @required this.bmiRange,
      @required this.bmiFeedBack});
  final String bmiResult;
  final String bmiValue;
  final String bmiRangeText;
  final String bmiRange;
  final String bmiFeedBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              // margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Text(
                'Your Result',
                style: kNumberStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Box(
              color: Color(0xFF1D1F33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: Text(bmiResult, style: bmiTextTextStyle),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(bmiValue, style: bmiNumberTextStyle),
                  ),
                  Text(
                    bmiRangeText,
                    style: kLabelTextStyle,
                  ),
                  Text(
                    bmiRange,
                    style: kResultPageTextStyle,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      bmiFeedBack,
                      style: kResultPageTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
