import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class app_button extends StatelessWidget{
  final MaterialAccentColor color;
  final VoidCallback onpressed;
  final String name;
  const app_button({this.color,this.onpressed,this.name});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
          color:  color,
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          child:SizedBox(
            child:FlatButton(
              child: Text(name),
              onPressed: onpressed,
            ) ,
          )
      ),
    );
  }
}