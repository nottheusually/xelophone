// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xelophone/components/my_button.dart';
import 'package:xelophone/components/my_textfield.dart';
import 'package:xelophone/components/square_tiles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  // Text editing controllers
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();

  //sign user in method
  void signUserIn()async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                //email textfield
                myTextField(
                  controller: widget.emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                myTextField(
                  controller: widget.passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
      
      
      
                const SizedBox(height: 10),
      
      
                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password'),
                    ],
                  ),
                ),
      
      
                const SizedBox(height: 25),
      
              //button
                MyButton(
                  onTap: widget.signUserIn,
                ),
      
      
                const SizedBox(height: 25),
      
                
                //or continue with
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
      
      
      
                const SizedBox(
                  height: 25,
                ),
      
                
                //Google + Apple sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //Google button
                    SquareTile(imagePath: 'lib/images/google1.png'),
                    // Image.asset('lib/images/google.jpg',
                    // height: 72,),
      
                    SizedBox(
                      width: 25,
                    ),
      
                    //Apple button
                    SquareTile(imagePath: 'lib/images/apple.png')
                    //   Image.asset('lib/images/apple.png',
                    //   height: 72,),
                  ],
                ),
      
      
                const SizedBox(height: 25),
      
      
                //Not a member + Register now
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
