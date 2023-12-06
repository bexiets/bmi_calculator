import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  static const routeName = '/result';
  const ResultPage({required this.bmiResult, required this.resultText, required this.interprtation});
  final String bmiResult;
  final String resultText;
  final String interprtation;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final  ResultPage args = ModalRoute.of(context)!.settings.arguments as ResultPage;
    return Scaffold(
      backgroundColor: Color(0xff1d2136),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff1d2136),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(20),
              child: Text(
                "YOUR RESULT",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              args.resultText,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            args.bmiResult,
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ) ,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            args.interprtation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                               color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPress: (){},
                    
                ),
                
                
              ),
               GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text(
                    'RE-CALCULATE',
                    textAlign: TextAlign.center,
                  
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      
                      
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  color: Color(0xFFEB1555),
                  height: 80,
                  width: double.infinity,
                ),
              ), 
              
           ],
          
        ),
        
      ),
    );
  }
}
