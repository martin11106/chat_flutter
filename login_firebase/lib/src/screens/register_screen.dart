import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfirebase/src/screens/service/authentication.dart';
import 'package:loginfirebase/src/screens/widgets/app_button.dart';
import 'package:loginfirebase/src/screens/widgets/app_icon.dart';
import 'package:loginfirebase/src/screens/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'mixins/validation_mixins.dart';

class register_Screen extends StatefulWidget{
  static const String ruteName = '/register';
  @override
  _register_ScreenState createState() => new _register_ScreenState();

}
class _register_ScreenState extends State<register_Screen> with ValidationMixins {
  final auth =FirebaseAuth.instance;
  String _email;
  String _password;
  TextEditingController emailController;
  TextEditingController passwordController;
  FocusNode focusNode;
  bool autovalidate=false ;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    focusNode = FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
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
            SizedBox(height: 24.0,),
            _buttonField()
          ],
        ),
      )),

    );

  }
  Widget _emailField(){
    return  app_textfield(name:"Ingresa el email",
      validator: validationEmail,
      autoValidate: autovalidate,
      Onsaved: (value){}
      ,controller: emailController,
      focusNode: focusNode,);

  }
  Widget _passwordField(){
    return app_textfield(
      name:"ingrese la password",
      autoValidate: autovalidate,
      validator: validationPassword,
      Onsaved: (value){_password=value;},
      obscureText: true,
      controller: passwordController,
    );
  }
  Widget _buttonField(){
    return app_button(
      color: Colors.blueAccent,
      onpressed: () async{
      if(form.currentState.validate()){
        var newUser =await authentication().createUser(email: emailController.text,password: passwordController.text);
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
      name: "registrarse",
    );
  }

}