import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class app_textfield extends StatelessWidget{
  final ValueChanged<String> Onsaved;
  final bool obscureText;
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final bool autoValidate;

  const app_textfield({this.name,this.Onsaved,this.obscureText=false,this.controller,this.focusNode,this.validator,this.autoValidate});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidate: autoValidate,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        hintText: name,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.blueAccent ,width: 2)
        ),
      ),
      onSaved: Onsaved,
      validator: validator,
      textAlign: TextAlign.center,
      obscureText:  obscureText == null ? false :obscureText,
    );
  }
}