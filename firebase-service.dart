import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
class FirebaseService {

  Future<void> add(String name,String email) async
  {
    await firebaseFirestore
        .collection('user')
        .add({"name": name, "email": email})
        .catchError((e){
          print(e.toString());
    })
        .whenComplete(() => print("success"));
  }


  Future<void> delete(String id) async
  {
    await firebaseFirestore.collection('user').doc(id).delete();
  }


  Future<void> update(String id,String name, String email)async
  {
    await firebaseFirestore.collection('user').doc(id).update
      (
        {
          "name": name,
          "email": email,

        }
      );
  }
}
