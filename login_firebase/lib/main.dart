import 'package:flutter/material.dart';
import 'package:loginfirebase/src/screens/login_screen.dart';
import 'package:loginfirebase/src/screens/main_screen.dart';
import 'package:loginfirebase/src/screens/register_screen.dart';
import 'package:loginfirebase/src/screens/welcome.dart';
void main() {
  runApp(
    MaterialApp(
      home: WelcomeScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black45)
        )
      ),
      initialRoute: WelcomeScreen.ruteName,
      routes: <String,WidgetBuilder>{
        Login_Screen.ruteName: (BuildContext contex)=>Login_Screen(),
        WelcomeScreen.ruteName: (BuildContext contex)=>WelcomeScreen(),
        register_Screen.ruteName: (BuildContext contex)=>register_Screen(),
        main_Screen.ruteName: (BuildContext contex)=>main_Screen(),
      },
    )
  );
}

