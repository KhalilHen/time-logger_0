import 'package:flutter/material.dart';






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


 TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Email',
                        border: OutlineInputBorder(),
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
    
  
],

  ),
   ),

          ],
      
  
  

          
        ),
        
      ),
    );
  }
} 


