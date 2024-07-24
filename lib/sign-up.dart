
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';




class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage    extends StatelessWidget {
   SignUpPage({super.key});
    final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();



// DB properties
  // const timelogger  = FirebaseFirestore.instance;

 final Users = <String, String> {


 };

// .collection('Users').doc('Users').set(Users);


 
  Future<void> _signUp(BuildContext context) async {
    if (_key.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,

        );

        if (userCredential.user != null) {
    //                 CollectionReference users = FirebaseFirestore.instance.collection('Users');
    // users.add({
      
    //   'username': usernameController.text,
    //   'email': emailController.text,
    //   'password': passwordController.text,
      
    //     });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully signed up')));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ()),
          );


          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => HomePage()),
          // );
        } else {
          print('Oops there went something wrong');
        }
      } catch (e) {
        print('Sign up failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
        final primaryBackground = Colors.blue;

    return Scaffold(
            backgroundColor: primaryBackground,

    



      body: Container(
   height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

SizedBox(height: 20),

Form(
  
              key: _key,

  child: Column(


children: [



// TODO Test this on a  real device, if it looks 
// TODO  better with the padding, or without.
 Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),

   child: TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter username',
                        border: OutlineInputBorder(),
                      ),
                    ),
 ),


 Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),

   child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
 ),
        

 TextFormField(
  
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Create password',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        else if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        }
                        return null;
                      },
                      // controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(onPressed: () => _signUp(context), child: Text('Sign Up',
                    
                    
                    )),
    
  
],

  ),
   ),

          ],
      
  
  

          
        ),
        
      ),
    );
  }

  
}





