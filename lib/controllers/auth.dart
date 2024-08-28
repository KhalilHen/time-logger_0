import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart'; 
import 'package:firebase_core/firebase_core.dart';
import '../main.dart';
import '../homepage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class AuthController {

 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();





      Future<void> login(BuildContext context) async {
    if (key.currentState!.validate()) {
      try {

        String lowerCaseEmail = emailController.text.toLowerCase();
emailController.text = lowerCaseEmail;



// if (emailController.text.contains('@') ) {
 UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        
          email: lowerCaseEmail,
          password: passwordController.text,
   
   
   
   
   
   
        );
           if (userCredential.user != null) {
          print('Login successful');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          print('Oops there went something wrong');
        }




// }
 
      } catch (e) {
        print('Login failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }


  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

      Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );


      Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );

  }


  Future<void> createUser(
      BuildContext context, String username, String email, String password) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      await users.add({
        'username': username,
        'email': email,
        'password': password,
      });

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully signed up')),
      );

      // Optionally, navigate to another screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up: $error')),
      );
    }
  }

// createUser() async {
//       if (formKey.currentState?.validate() ?? false) {
//               final username = usernameController.text;
//               final email = emailController.text;
//               final password = passwordController.text;

//               CollectionReference users = FirebaseFirestore.instance.collection('Users');

//               users.add({
//                 'username': username,
//                 'email': email,
//                 'password': password,
//               }).then((_) {
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Successfully signed up')),
//                 );
//               }).catchError((error) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Failed to sign up: $error')),
//                 );
//               });
//             }
//   }


}