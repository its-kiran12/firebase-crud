import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/firebase_service/firebase-service.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Firebase Crud"),
      ),

      body: Column(
        children: [


          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "name"
            ),
          ),

          TextField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: "email"
            ),
          ),

          ElevatedButton(onPressed: ()async{
            await _firebaseService.add(nameController.text, emailController.text );
            nameController.clear();
            emailController.clear();

            },
              child: Text("Add")),

          Expanded(
              child: StreamBuilder(
                  stream: firebaseFirestore.collection('user').snapshots(),

              builder: (context , snapshots){
                return ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context , index){
                    final res = snapshots.data!.docs[index];
                    return ListTile(
                      title: Text(res['name']),
                      subtitle: Text(res['email']),
                    );
                    }
                    );
              }
              )
          )
        ],
      ),
    );
  }
}
