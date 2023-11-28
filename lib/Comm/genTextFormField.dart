import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObsecureText;
  TextInputType inputType;



  getTextFormField(
      {required this.controller,
      required this.hintName,
      required this.icon,
      this.isObsecureText = false,
      this.inputType= TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecureText,
        keyboardType: inputType,
        validator: (val)=> val?.length == 0?'Please Enter $hintName' : null ,
        onSaved: (val)=> controller.text = val!,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.transparent),

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            prefixIcon: Icon(icon),
            hintText: hintName,
            fillColor: Colors.grey[200],
            filled: true,
        ),
      ),
    );
  }
}
