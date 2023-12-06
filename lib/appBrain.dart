
import 'dart:math';

class appBrain{
  appBrain({required this.height, required this.weight,});

  final double height;
  final int weight;
  double bmi = 0.0;

  String calculateBMI(){
    bmi = weight /pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi >= 25){
      return 'Overweight';
    }
    else if(bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretion(){
    if(bmi >=25){
      return 'You have higher than normal body weight. Try exercising more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!.';
    } else {
      return 'You have lower than normal body weight. You can eat bit more.';
    }
    
  }

}