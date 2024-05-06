import 'package:flutter/material.dart';

class TFormField extends StatelessWidget {
  TextEditingController numberController = TextEditingController();
  // TextEditingController number2Controller = TextEditingController();
  // TFormField({super.key});
  //
  // @override
  // State<TFormField> createState() => _TFormFieldState();

  String hint,errormsg;

  TFormField(
      {super.key,
      required this.hint,
      required this.errormsg,
      required this.numberController}
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child:TextFormField(
        controller: numberController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Colors.red,width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: hint,
        ),
        validator: (String? input) { //function will be called frm btn
          //this validates field
          if (input != null && input.isNotEmpty ) {
            return null;
          } else {
            return errormsg;
          }
        },
      ),
    );
  }
}

// class _TFormFieldState extends State<TFormField> {
//
// }
