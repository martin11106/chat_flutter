import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfirebase/src/screens/service/authentication.dart';
import 'package:loginfirebase/src/screens/widgets/app_button.dart';
import 'package:loginfirebase/src/screens/widgets/app_icon.dart';
import 'package:loginfirebase/src/screens/widgets/app_textfield.dart';
import 'mixins/validation_mixins.dart';

class Login_Screen extends StatefulWidget{
  static const String ruteName = '/login';
  @override
  _Login_ScreenState createState() => new _Login_ScreenState();

}
class _Login_ScreenState extends State<Login_Screen> with ValidationMixins{
  final auth = FirebaseAuth.instance;
  String _email;
  String _password;
  bool autovalidate=false ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusNode;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
          key: form,
          child:Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              app_icon(),
              SizedBox(height: 48.0,),
              _emailField(),
              SizedBox(height: 8.0,),
              _passwordField(),
              SizedBox(height: 23.0,),
              _buttonField()

        ],
      ),
      )),

    );

  }
  Widget _emailField(){
    return app_textfield(name:"Ingresa el email",
      Onsaved: (value){},
      autoValidate: autovalidate,
      validator: validationEmail,
      controller: emailController,focusNode: focusNode,);

  }
  Widget _passwordField(){
   return app_textfield(name:"ingrese la password",
      validator: validationPassword,
     autoValidate: autovalidate,
      Onsaved: (value){},
      obscureText: true,
      controller: passwordController,
    );
  }
  Widget _buttonField(){
    return app_button(
      color: Colors.blueAccent,

      onpressed: () async{
        if(form.currentState.validate()){
          var newUser =await authentication().loginUser( email: emailController.text,password: passwordController.text);
          if(newUser != null){
            Navigator.pushNamed(context, "/main");
          }
          FocusScope.of(context).requestFocus(focusNode);
          emailController.text = "";
          passwordController.text="";
        }else{
          setState(() => autovalidate=true);
        }
      },
      name: "Log in",
    );
  }

}