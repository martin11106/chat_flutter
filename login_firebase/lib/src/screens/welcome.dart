import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfirebase/src/screens/widgets/app_button.dart';
import 'package:loginfirebase/src/screens/widgets/app_icon.dart';

class WelcomeScreen extends StatefulWidget{
  static const String ruteName = '';
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();

}
class _WelcomeScreenState extends State<WelcomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            app_icon(),
            SizedBox(height: 48.0,),
            app_button( color:Colors.lightBlueAccent,
                onpressed:(){
                  Navigator.pushNamed(context, '/login');
                },
              name: "Log in",
            ),
            app_button(
                color: Colors.blueAccent,
                onpressed:(){
                  Navigator.pushNamed(context, '/register');
                },
                name:"Register",
            )


          ],
        ),
      ),
    );

  }


}