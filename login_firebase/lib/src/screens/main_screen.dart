import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfirebase/src/screens/service/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginfirebase/src/screens/service/message.dart';

class main_Screen extends StatefulWidget{
  static const String ruteName = '/main';
  @override
  _main_ScreenState createState() => new _main_ScreenState();

}
class _main_ScreenState extends State<main_Screen>{
  final auth =FirebaseAuth.instance;
  final  firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  TextEditingController _messagecontroller = TextEditingController();


  InputDecoration _messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    hintText:  "ingrese su mensage aqui",
    border: InputBorder.none
  );


  BoxDecoration _messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightBlueAccent,width: 2.0)
    )
  );

  TextStyle _sendButtonStyle = TextStyle(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.bold,
      fontSize: 18.0
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    getMessage();
  }
  void getMessage() async{
    final messages =  messageService().getMessageStream();
    await for(var messageStream in messageService().getMessageStream()){
      for(var message in messageStream.documents){
          print(message.data);
      }
    }
  }
  void getCurrentUser() async{
    try{
      var user = await authentication().getCurrentUser();

      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }catch(e){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: (){
                authentication().singUp();
                Navigator.pop(context);
            },
          )
        ],
      ) ,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: _messageContainerDecoration,
              child:Row(
                children: <Widget>[
                  StreamBuilder(
                    stream: messageService().getMessageStream(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var messages = snapshot.data.documents;
                        List<Text> messageWitget=[];
                        List<chat_Item> message=[];
                        for(var message in messages){
                          final messageValue = message.data["value"];
                          final messageSender = message.data["sender"];
                          message.add(chat_Item(messageSender,messageValue,messageSender==loggedInUser.email));
                        }
                        return Flexible(
                            child:ListView(
                          children:message,
                        ));
                      }
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration:_messageTextFieldDecoration ,
                      controller: _messagecontroller,
                    ),
                  ),
                  FlatButton(
                    child: Text("enviar",style: _sendButtonStyle,),
                    onPressed: (){

                        messageService().Save("messages",{
                          'sender':loggedInUser.email,
                          'value':_messagecontroller.text

                        } );
                        _messagecontroller.clear();
                        },
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );

  }


}

class chat_Item extends StatelessWidget{
  final String sender;
  final String value;
  final bool LoginUser;
  chat_Item(this.sender,this.value,this.LoginUser);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(this.sender,style: TextStyle(fontSize: 15.0,color: Colors.black54),),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(20.0)
            ),
            elevation: 5.0,
            color: LoginUser ? Colors.blueAccent: Colors.white,
            child:    Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(this.value,style: TextStyle(fontSize: 16.0,color:LoginUser ? Colors.white: Colors.black54),),),
            )


        ],
      ),
    );
  }
}