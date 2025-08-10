import 'package:flutter/material.dart';
import 'Calculator Button Widget/button_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _input ='0';
  String _ope ='0';
  double num1 =0;
  double num2 =0;
  
  void buttonPress(String value) {
    print('int value = $value');

    setState(() {
      if(value == 'C') {
         _output = '0';
         _input ='0';
         _ope ='';
         num1 =0;
         num2 =0;
      } else if (value == '=') {
        num2 = double.parse(_input);
        if(_ope == '+') {
          _input = (num1+num2).toString();
        }else if(_ope == '-') {
          _input = (num1 - num2).toString();
        } else if(_ope == '*') {
          _input = (num1 * num2).toString();
        } else if(_ope == '/') {
          _input = (num2 != 0 ? (num1/num2).toString() : 'Error');
        }
        _input = _output;
      } else if (['+','-','*','/'].contains(value)){
        num1 = double.parse(_input);
        _ope= value;
        _input ='';
      } else {
        if( value == '0') {
          _input = value;
        } else{
          _input +=value;
        }
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(50),
              child: Text(_output, style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
            ),
          ),
          Row(
            children: [
              CalculatorButton(onClick: ()=> buttonPress('7'), text: '7'),
              CalculatorButton(onClick: ()=> buttonPress('8'), text: '8'),
              CalculatorButton(onClick: ()=> buttonPress('9'), text: '9'),
              CalculatorButton(onClick: ()=> buttonPress('/'), text: '/', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              CalculatorButton(onClick: ()=> buttonPress('4'), text: '4'),
              CalculatorButton(onClick: ()=> buttonPress('5'), text: '5'),
              CalculatorButton(onClick: ()=> buttonPress('6'), text: '6'),
              CalculatorButton(onClick: ()=> buttonPress('*'), text: '*', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              CalculatorButton(onClick: ()=> buttonPress('1'), text: '1'),
              CalculatorButton(onClick: ()=> buttonPress('2'), text: '2'),
              CalculatorButton(onClick: ()=> buttonPress('3'), text: '3'),
              CalculatorButton(onClick: ()=> buttonPress('-'), text: '-', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              CalculatorButton(onClick: ()=> buttonPress('C'), text: 'C'),
              CalculatorButton(onClick: ()=> buttonPress('0'), text: '0'),
              CalculatorButton(onClick: ()=> buttonPress('='), text: '='),
              CalculatorButton(onClick: ()=> buttonPress('+'), text: '+', color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

