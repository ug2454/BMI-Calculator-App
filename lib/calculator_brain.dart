import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int weight;
  final int height;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30.0) {
      return 'OBESE';
    } else if (_bmi > 25.0) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getFeedBack() {
    if (_bmi >= 30.0) {
      return 'You have very high body weight. Stop eating and exercise more!';
    } else if (_bmi > 25.0) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You need to eat a bit more';
    }
  }

  String getBMIRange() {
    if (_bmi >= 30.0) {
      return '30 - 39.9kg/m2';
    } else if (_bmi > 25.0) {
      return '25 - 29.9kg/m2';
    } else if (_bmi > 18.5) {
      return '18.5 - 24.9kg/m2';
    } else {
      return '< 18kg/m2';
    }
  }

  String getBMIRangeText() {
    if (_bmi >= 30.0) {
      return 'Obese BMI Range';
    } else if (_bmi > 25.0) {
      return 'Overweight BMI Range';
    } else if (_bmi > 18.5) {
      return 'Normal BMI Range';
    } else {
      return 'Underweight BMI Range';
    }
  }
}
