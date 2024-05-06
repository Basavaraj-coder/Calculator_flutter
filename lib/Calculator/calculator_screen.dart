//import 'package:calculator/Btn/Btn_cal.dart';
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
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          //above line calls validate()
                          // print("values from field 1 ${number1Controler.text}");
                          // print("values from field 2 ${number2Controler.text}");
                          // print("added value ${number1Controler.text+number2Controler.text}");
                          int temp1 = int.parse(number1Controler.text);
                          int temp2 = int.parse(number2Controler.text);
                          int sum=  temp1+temp2;
                          res = sum.toString();
                          clearText();
                        }
                      },
                      child: const Text("Add",style: TextStyle(fontSize: 20),)),
                  // Btn_cal(
                  //     formKey: _formKey,
                  //     number1Controller: number1Controler,
                  //     number2Controller: number2Controler,
                  //     displayTextbtn: "add"),
                  // Btn_cal(
                  //     formKey: _formKey,
                  //     number1Controller: number1Controler,
                  //     number2Controller: number2Controler,
                  //     displayTextbtn: "sub"),
                  // Btn_cal(
                  //     formKey: _formKey,
                  //     number1Controller: number1Controler,
                  //     number2Controller: number2Controler,
                  //     displayTextbtn: "mul"),
                  // Btn_cal(
                  //     formKey: _formKey,
                  //     number1Controller: number1Controler,
                  //     number2Controller: number2Controler,
                  //     displayTextbtn: "div"),

                  FilledButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          //above line calls validate()
                          // print("values from field 1 ${number1Controler.text}");
                          // print("values from field 2 ${number2Controler.text}");
                          int temp1 = int.parse(number1Controler.text);
                          int temp2 = int.parse(number2Controler.text);
                          int sum = temp1-temp2;
                          res = sum.toString();
                          clearText();
                         // print("sub values $res");
                        }
                      },
                      child: const Text("Sub",style: TextStyle(fontSize: 20),)),
                  FilledButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          //above line calls validate()
                          // print("values from field 1 ${number1Controler.text}");
                          // print("values from field 2 ${number2Controler.text}");
                          int temp1 = int.parse(number1Controler.text);
                          int temp2 = int.parse(number2Controler.text);
                          int sum = temp1*temp2;
                          res = sum.toString();
                          clearText();

                        }
                      },
                      child: const Text("Mul",style: TextStyle(fontSize: 20),)),
                  FilledButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          //above line calls validate()
                          print("values from field 1 ${number1Controler.text}");
                          print("values from field 2 ${number2Controler.text}");

                          int temp1 = int.parse(number1Controler.text);
                          int temp2 = int.parse(number2Controler.text);
                          double sum = temp1/temp2;
                          res = sum.toString();
                          clearText();

                        }
                      },
                      child: const Text("Div",style: TextStyle(fontSize: 20),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearText() {
    setState(() {

    });
    number1Controler.text = "";
    number2Controler.text = "";
  }
}
