import 'package:cloud_firestore/cloud_firestore.dart';

class messageService{
  final firestore = Firestore.instance;
  void Save(String collectionName,Map<String,dynamic> collectionValues){
    firestore.collection(collectionName).add(collectionValues);
  }
  Future<QuerySnapshot> getMessage() async{
    return await firestore.collection("messages").getDocuments();
  }
  Stream<QuerySnapshot> getMessageStream(){
    return Firestore.instance.collection("messages").orderBy("timestamp", descending: true).snapshots();
  }
}