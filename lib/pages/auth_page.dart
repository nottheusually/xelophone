import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xelophone/pages/home_page.dart';
import 'package:xelophone/pages/loginpage.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          //is user logged in?
          if (snapshot.hasData){
            return HomePage1();
          }
          //user is NOT logged in
          else {
            return LoginPage();
          }
        }
      ),
    );
  }
}