import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage1 extends StatelessWidget {
   HomePage1({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ],),
      body: Center(
        child: Text('Logged in'),
      ),
    );
  }
}