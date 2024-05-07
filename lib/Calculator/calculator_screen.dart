//import 'package:calculator/Btn/Btn_cal.dart';
import 'package:calculator/Calculator/calculator_field_enum.dart';
import 'package:calculator/FormField/TFromField.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => CalculatorState();
//callback function
}

class CalculatorState extends State<Calculator> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  //this identifies each field uniquely

  //what if we have more fields than how to get values of fields,there is smthing
  //called as controllers
  TextEditingController number1Controler = TextEditingController();
  TextEditingController number2Controler = TextEditingController();
  String res = "0";
  double sum=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Form(
          key: _formKey, //this key detect each field unique
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TFormField(
                  hint: 'Enter number1',
                  errormsg: "please enter num",
                  numberController: number1Controler,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TFormField(
                  hint: "Enter number2",
                  errormsg: "Length of phone number",
                  numberController: number2Controler,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Result : $res",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                      onPressed: () {
                        calculate(CalculatorFieldEnum.ADDITION_BUTTON);
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 20),
                      )),
                  FilledButton(
                      onPressed: () {
                        calculate(CalculatorFieldEnum.SUBSTRACTION_BUTTON);
                      },
                      child: const Text(
                        "Sub",
                        style: TextStyle(fontSize: 20),
                      )),
                  FilledButton(
                      onPressed: () {
                        calculate(CalculatorFieldEnum.MULTIPLICATION_BUTTON);
                      },
                      child: const Text(
                        "Mul",
                        style: TextStyle(fontSize: 20),
                      )),
                  FilledButton(
                      onPressed: () {
                        calculate(CalculatorFieldEnum.DIVISION_BUTTON);
                      },
                      child: const Text(
                        "Div",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearText() {
    setState(() {});
    number1Controler.text = "";
    number2Controler.text = "";
  }

  void calculate(CalculatorFieldEnum cenum) {

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      //above line calls validate()
      print("values from field 1 ${number1Controler.text}");
      print("values from field 2 ${number2Controler.text}");
      int temp1 = int.parse(number1Controler.text);
      int temp2 = int.parse(number2Controler.text);

      switch (cenum) {
        case CalculatorFieldEnum.ADDITION_BUTTON:
          {
            sum = (temp1 + temp2) as double;
            print("hashcode ${sum.hashCode}");
            res = sum.toString();
            clearText();
          }
          break;
        case CalculatorFieldEnum.SUBSTRACTION_BUTTON:
          {
            sum = (temp1 - temp2) as double;
            print("hashcode ${sum.hashCode}");
            res = sum.toString();
            clearText();
          }
          break;
        case CalculatorFieldEnum.MULTIPLICATION_BUTTON:
          {
            sum = (temp1 * temp2) as double;
            print("hashcode ${sum.hashCode}");
            res = sum.toString();
            clearText();
          }
          break;
        case CalculatorFieldEnum.DIVISION_BUTTON:
          {
            sum = temp1 / temp2;
            res = sum.toString();
            clearText();
          }
          break;
      }
    }
  }
}
