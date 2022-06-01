
import 'package:flutter/material.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcButton(String btnText,Color btncolor, Color txtcolor){
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          shape: const CircleBorder(),
          primary: btncolor,
          
        );
     return Container(
          child: ElevatedButton(
            onPressed:() => {
            calculation(btnText)
          },
          // style: ButtonStyle(
          //     shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          //     padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),

          //     side: MaterialStateProperty.resolveWith<BorderSide>(
          //     (Set<MaterialState>states){
          //     final Color color = states.contains(MaterialState.pressed) ? Colors.yellow : Colors.red;
          //     return BorderSide(color: color);
          //   })
          // ),
          style: raisedButtonStyle, 
          child: Text(btnText,style: TextStyle(fontSize: 25.0, color: txtcolor)),
          ),
               );
  }
final ButtonStyle raisedBtnStyle = ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0,0,0,0),
          shape: const StadiumBorder(),
          primary: Colors.white,

          
        );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.black, 
       appBar: AppBar(title: const Text('MIRsquared Calculator',style: TextStyle(color: Colors.black),),backgroundColor: Colors.amber,),
       body: Padding(padding:const EdgeInsets.symmetric(horizontal: 5.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children:  [
           //Calculator display
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
              Padding(padding: EdgeInsets.all(10),
              child: Text(text,
              textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 100.0),),
              ),
             ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguments
                   calcButton('AC',Colors.grey, Colors.black),
                   calcButton('+/-',Colors.grey, Colors.black),
                   calcButton('%',Colors.grey, Colors.black),
                   calcButton('/',Color.fromARGB(255, 204, 155, 10), Colors.white),
              ],
            ),
            const SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguments
                   calcButton('9',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('8',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('7',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('x',const Color.fromARGB(255, 204, 155, 10), Colors.white),
              ],
            ),
            const SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguments
                   calcButton('6',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('5',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('4',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('-',const Color.fromARGB(255, 204, 155, 10), Colors.white),
              ],
            ),
            const SizedBox(height: 20),
 Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here buttons function will be called where we will pass some arguments
                   calcButton('3',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('2',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('1',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                   calcButton('+',const Color.fromARGB(255, 204, 155, 10), Colors.white),
              ],
            ),
            const SizedBox(height: 20),
               Padding(
                 padding: const EdgeInsets.only(left: 4.0,right: 20.0),
                 child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  
                  ElevatedButton(onPressed: null, 
                  
                  style: raisedBtnStyle,
                  child:const Text('0', style: TextStyle(fontSize: 25.0,color: Colors.white),)),
                   calcButton('.',const Color.fromARGB(255, 133, 125, 125), Colors.white),
                     calcButton('=',const Color.fromARGB(255, 204, 155, 10), Colors.white),
                      // calcButton('=',const Color.fromARGB(255, 204, 155, 10), Colors.white),
                    
              ],
            ),
               ),
            const SizedBox(height: 20),
         ],
       ),) ,
    );
  }

  //app logic here
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }

}

 

 

