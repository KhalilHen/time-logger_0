import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'firebase_options.dart';

import 'homepage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState>  _key = GlobalKey<FormState>();



  Future<void> _login() async {
  if (_key.currentState!.validate()) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
       
        print('Login successful');
      } else {
        print('Oops there went something wrong');
      }
    } catch (e) {
      print('Login failed: $e');
      SnackBar(content: Text('Login failed: $e'));
    }
  }
}
@override 
  Widget build(BuildContext context) {
    final primaryBackground = Colors.blue;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryBackground,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: validateEmail,
                      decoration: const InputDecoration(
                        labelText: 'Enter email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: validatePassword,
                      decoration: const InputDecoration(
                        labelText: 'Enter password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _login(),
  style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
  ),
                        child: Text(
                          'Login',


                          style: TextStyle(color: Colors.white, fontSize: 20),
                          
                        ),
                      ),
                      SizedBox(width: 40),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
backgroundColor: Colors.cyan,
  ),
                        onPressed: () {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    
    
    );
  }
}



String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) return 'Invalid Email address';
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) return 'Invalid password';


  return null;
}
