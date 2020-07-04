import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class app_icon extends StatefulWidget{
  static const String ruteName = '/login';
  @override
  _app_iconState createState() => new _app_iconState();

}
class _app_iconState extends State<app_icon>{

  @override
  Widget build(BuildContext context) {
    return
      Row(
      children: <Widget>[
        Image(
          image: AssetImage('images/chat.png'),
        ),
        Text("ABOCADO",style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w700
        ),),

      ],
    );

  }


}