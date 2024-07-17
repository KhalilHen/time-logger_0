import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryBackground = Colors.blue;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryBackground,
        body: Center(

  heightFactor: MediaQuery.of(context).size.height * 0.7,
widthFactor: MediaQuery.of(context).size.width * 0.9,

  child: Column(


    //TODO give this a max height
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

 
//  crossAxisAlignment: CrossAxisAlignment.end,
 
children: [

Text('Login',



style: TextStyle(color: Colors.white, fontSize: 30),

),

     TextFormField(
                        // controller: emailController,
                        // validator: validateEmail,
                        decoration: const InputDecoration(
                          labelText: 'Enter email',
                          border: OutlineInputBorder(),
                        ),


                      ),


TextFormField(


     decoration: const InputDecoration(
                          labelText: 'Enter passsword',
                          border: OutlineInputBorder(),
                        ),

),





Row(

  mainAxisAlignment: MainAxisAlignment.center,
  
children: [


  ElevatedButton(onPressed: null, child: Text(


    style:
    
    TextStyle(color:Colors.white,fontSize:20),
    
    'Login')),

    SizedBox(width: 40),















  ElevatedButton(onPressed: null, child: Text(


    style:
    
    TextStyle(color:Colors.white,fontSize:20),
    
    'sign up'))



],
),

],

  ),

        ),
      ),
    );
  }
}


