import 'package:firebase_auth/firebase_auth.dart';


class authentication{
  final auth =FirebaseAuth.instance;
  Future<AuthResult> createUser({String email = "", String password = ""}) async {
    try{
      return await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<FirebaseUser> getCurrentUser() async {
    try{
      return await auth.currentUser();
    }catch(e){
      print(e);
    }

    return null;
  }
  Future<AuthResult> loginUser({String email = "", String password = ""}  ) async {
    try{
      return await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e);
    }
    return null;
  }
  




  Future<void> singUp() async {
    try{
      return await auth.signOut();
    }catch(e){
      print(e);
    }

    return null;
  }
}