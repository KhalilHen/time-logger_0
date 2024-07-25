
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'homepage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dialogs/sign-up-dialog.dart';


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


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}



class _SignUpPageState    extends State<SignUpPage> {

    final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

   bool showPassword = false;

// DB properties
  // const timelogger  = FirebaseFirestore.instance;

@override
  void initState() {
    passwordVisible = false;
  }



 
  Future<void> _signUp(BuildContext context) async {
    if (_key.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,

        );

        if (userCredential.user != null) {
  
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully signed up')));
     showDialog(
  context: context,
  builder: (context) {
    return SignUpDialog(email: emailController.text, password: passwordController.text);
  },
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
//  Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24.0),

//    child: TextFormField(
//                       controller: usernameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Enter username',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//  ),
                 SizedBox(height: 20),



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
                         SizedBox(height: 20),


 Padding(


      padding: const EdgeInsets.symmetric(horizontal: 24.0),
   child: TextFormField(
       obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Create password',
                          border: OutlineInputBorder(),


                          suffixIcon: IconButton( 

icon: Icon(

                            passwordVisible ? Icons.visibility : Icons.visibility_off,

color: Theme.of(context).primaryColorDark,
),
onPressed: () {

setState(() {
  
  passwordVisible = !passwordVisible;
});

},

),
                        ),

                        
                      ),
 ),



                SizedBox(height: 20),

                    Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                               obscureText: true,

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
                    ),


                SizedBox(height: 20),


                    ElevatedButton(onPressed: () => _signUp(context), child: Text('Sign Up',
                    
                    
                    )), 
                    ElevatedButton(onPressed: () {
      showDialog(
  context: context,
  builder: (context) {
    return SignUpDialog(email: emailController.text, password: passwordController.text);

  },
);
                    }, child: Text('Sign up dialog ',
                    
                    
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





