


import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/RoundIconButton.dart';
import 'package:bmi_calculator/appBrain.dart';
import 'package:bmi_calculator/cardChild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ResultPage.dart';


const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor = Color(0xFF111328);






const activeCardColor = Color(0xff1d1e33);
const inActiveCardColor = Color(0xFF111328);

enum Gender {Male, Female}



void main() {
  runApp(
    MaterialApp(
      home:   BMICalculatorScreen(),
      routes: {
        ResultPage.routeName: (context) => ResultPage(bmiResult: '', resultText: '', interprtation: '', )
        
      },
      
    )

  );
}



class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});
  
  
  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  
  late Gender _selectedGender = Gender.Male;
   
  double height = 150.0;
  int weight = 60;  
  int age = 18;  
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d2136),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff1d2136),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        
                        setState(() {
                          _selectedGender = Gender.Male;
                        });
                      },
                      cardChild: cardChild(
                        
                        icon: FontAwesomeIcons.mars,
                        
                        label: 'MALE',
                      ),
                      colour: _selectedGender == Gender.Male
                        ?activeCardColor
                        :inActiveCardColor
                    ) 
                  ),
                  Expanded(
                    child:  ReusableCard(
                      onPress: (){
                        
                        setState(() {
                          _selectedGender = Gender.Female;
                        });
                      },
                      cardChild: cardChild(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        
                      ),
                      colour: _selectedGender == Gender.Female
                        ?activeCardColor
                        :inActiveCardColor
                    ) 
                  )
                  

                ],
                
              )
            ),
            Expanded(
              child: ReusableCard(
                onPress: (){},
                
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          height.round().toString(),
                        ),
                        Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),

                        ),
                      )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0xffeb1555),
                        thumbShape: 
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30.0),
                      ) , 
                      child: Slider(
                        value: height,
                        min: 120,
                        max: 220, 
                        onChanged: (double  newValue){
                          setState(() {
                            height =  newValue;
                            
                          });
                        })
                      )
                  ],
                ),
              ) 
            ),
            Expanded(
              child: Row(
                children: [
                 Expanded(
                    child:  ReusableCard(
                      onPress: (){

                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF8D8E98),
                             ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus, 
                                onPressed: (){
                                  setState(() {
                                    if(weight >30 ){
                                      weight--;
                                    }
                                  });
                                }),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus, 
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      colour: activeCardColor
                    ) 
                  ),
                  Expanded(
                    child:  ReusableCard(
                      onPress: (){

                      },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF8D8E98),
                             ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus, 
                                onPressed: (){
                                  setState(() {
                                    if(age > 2 ){
                                      age--;
                                    }
                                  });
                                }),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus, 
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      colour: activeCardColor
                    ) 
                  ),
                ],
              )
               
            ),
            GestureDetector(
              onTap: (){
                appBrain calc = appBrain(height: height, weight: weight);
                Navigator.pushNamed(
                context,
                ResultPage.routeName,
                arguments: ResultPage(
                  bmiResult: calc.calculateBMI(), 
                  resultText: calc.getResult(), 
                  interprtation: calc.getInterpretion()
                )  
              );},
              child: Container(
                child: Text(
                  'CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    
                  ),
                ),
                margin: EdgeInsets.only(top: 10.0),
                color: Color(0xFFEB1555),
                height: 70,
                width: double.infinity,
              ),
            )  
            
          ],
          
        )
          
        
      ),
      
    );
  }

 
}


