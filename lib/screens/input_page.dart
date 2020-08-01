import 'dart:async';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../screens/results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  static int height = 180;
  static int weight = 50;
  static int age = 10;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Box(
                    color: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: GenderWidget(
                      icon: kMaleIcon,
                      genderText: 'MALE',
                    ),
                    gender: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Box(
                    color: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: GenderWidget(
                      icon: kFemaleIcon,
                      genderText: 'FEMALE',
                    ),
                    gender: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Box(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: kNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFFEB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbColor: Colors.white,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                                print(height);
                              });
                            },
                            min: 120.0,
                            max: 250.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Box(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FloatingActionButton(
                                heroTag: 'weightminus',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (weight > 20) {
                                        weight--;
                                      }
                                    });
                                    print(weight);
                                  },
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 100), (t) {
                                      setState(() {
                                        if (weight > 20) {
                                          weight--;
                                        }
                                        print(weight);
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer.cancel();
                                  },
                                  onTapCancel: () {
                                    timer.cancel();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FloatingActionButton(
                                heroTag: 'weightplus',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (weight < 150) {
                                        weight++;
                                      }
                                    });
                                    print(weight);
                                  },
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 100), (t) {
                                      setState(() {
                                        if (weight < 150) {
                                          weight++;
                                        }
                                        print(weight);
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer.cancel();
                                  },
                                  onTapCancel: () {
                                    timer.cancel();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Box(
                    color: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FloatingActionButton(
                                heroTag: 'ageminus',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (age > 5) {
                                        age--;
                                      }
                                    });
                                    print(age);
                                  },
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 100), (t) {
                                      setState(() {
                                        if (age > 5) {
                                          age--;
                                        }
                                      });
                                      print(age);
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer.cancel();
                                  },
                                  onTapCancel: () {
                                    timer.cancel();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FloatingActionButton(
                                heroTag: 'ageplus',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (age < 100) {
                                        age++;
                                      }
                                    });
                                    print(age);
                                  },
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 100), (t) {
                                      setState(() {
                                        if (age < 100) {
                                          age++;
                                        }
                                      });
                                      print(age);
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer.cancel();
                                  },
                                  onTapCancel: () {
                                    timer.cancel();
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onTap: () {
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                      bmiValue: calculatorBrain.calculateBMI(),
                      bmiResult: calculatorBrain.getResult(),
                      bmiRangeText: calculatorBrain.getBMIRangeText(),
                      bmiRange: calculatorBrain.getBMIRange(),
                      bmiFeedBack: calculatorBrain.getFeedBack()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
