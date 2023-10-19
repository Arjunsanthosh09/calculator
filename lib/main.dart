import 'package:calculatorui/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() 
{
  runApp(MaterialApp(
    home: const calculatorapp(), //running the app 
  ));
}

class calculatorapp extends StatefulWidget {
  const calculatorapp({super.key});

  @override
  State<calculatorapp> createState() => _calculatorappState();
}

class _calculatorappState extends State<calculatorapp> {
  double firstNum=0.0;
  double secondNum=0.0;
  var input= '';
  var output='';
  var operation='';

   onButtonClick(value){
      if(value=="AC")
      {
            input= '';
           output='';
      }
      else if(value=="<"){
        if(input.isEmpty){
        input=input.substring(0,input.length-1);
        }
      }
      else if(value=="="){
        var userInput=input;  
        userInput=input.replaceAll("x", "*");
        Parser p=Parser();
        Expression expression=p.parse(userInput);
       ContextModel cm=ContextModel();
       var finalValue=expression.evaluate(EvaluationType.REAL, cm);
       output=finalValue.toString();
         
      }
      else{
        input=input+value;
      }
      setState(() {
        
      });
   }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        
        
        //input output
        children: [
          Expanded(child: Container(
           width: double.infinity,
            padding: EdgeInsets.all(12),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                   Text(
                    output,
                   style: TextStyle(
                  fontSize: 48,
                  color: Colors.white.withOpacity(0.7),
                ),
                ),
                 SizedBox(
                  height: 34,
                ),

              ],
            ),
          ),
          ),

          //buttons section 1

          Row(children: [  
            
            button(
              text: "AC",buttonBgcolor:operatorcolor,tColor: orangecolor),
            button(
              text: "<",buttonBgcolor: operatorcolor,tColor: orangecolor),
            button(
              text: "",buttonBgcolor: Colors.transparent),
            button(
              text: "/",buttonBgcolor: operatorcolor,tColor: orangecolor)                
         ],
          ),
          
          //button section 2

          Row(children: [  
            
            button(
              text: "7"),
            button(
              text: "8"),
            button(
              text: "9",),
            button(
              text: "*",buttonBgcolor: operatorcolor,tColor: orangecolor)                
         ],
          ),
          
          //button section 3
          Row(children: [  
            
            button(
              text: "4"),
            button(
              text: "5"),
            button(
              text: "6",),
            button(
              text: "-",buttonBgcolor: operatorcolor,tColor: orangecolor)              
         ],
          ),
          
          //button section 4


          Row(children: [  
            
            button(
              text: "1"),
            button(
              text: "2"),
            button(
              text: "3"),
            button(
              text: "+",buttonBgcolor: operatorcolor,tColor: orangecolor)               
         ],
          ),
           Row(children: [  
            
            button(
              text: "%",buttonBgcolor: operatorcolor,tColor: orangecolor),
            button(
              text: "0"),
            button(
              text: ".",buttonBgcolor: operatorcolor,tColor: orangecolor),
            button(
              text: "=",buttonBgcolor: operatorcolor,tColor: orangecolor)               
         ],
          ),
        ],
      ),
    );
  }

  Widget button(
    {
      text,tColor =Colors.white,buttonBgcolor=buttonclor,
    }
  )
  {
    //button function  

    return   Expanded(child: Container(
              margin: const EdgeInsets.all(8),
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(22),
                  primary: buttonBgcolor,
                  
                  backgroundColor: buttonclor
                  ),//setting the button colour primary is not working ...

                onPressed: () =>onButtonClick(text), 
                child:  Text(text,style: TextStyle(
                  fontSize: 18,
                  color: tColor,
                  fontWeight: FontWeight.w100,
                ),),
              ),
              
            ),
            );
  }
}
