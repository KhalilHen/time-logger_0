import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/auth.dart';
class SignUpDialog extends StatefulWidget {
  const SignUpDialog({
    Key? key,
    // required this.username,
    required this.email,
    required this.password,
  }) : super(key: key);

  // final String username;
final String email;
final String password;  
  @override
  _SignUpDialogState createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var passwordVisible;

  final AuthController authController = AuthController();
 

@override  
void initState() { 
    passwordVisible = true;
super.initState();
    emailController.text = widget.email;
    passwordController.text = widget.password;
    
}

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  // Function of creating user in the db collection


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Set Up Your Account',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
    enabled: false, 

                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),

                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              IgnorePointer(
              ignoring: true,
                child: TextFormField(
                  controller: passwordController,
                
                  obscureText: passwordVisible!,
                 
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                
suffixIcon: IconButton( 

icon: Icon(


    passwordVisible ? Icons.visibility : Icons.visibility_off,
color: Theme.of(context).primaryColorDark,
),
onPressed: () {

setState(() {
  passwordVisible = !passwordVisible;
});(() {



});

},

),
                ),
                  
             
                
                
                  
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
             if (_formKey.currentState?.validate() ?? false) {
              authController.createUser(
                context,
                usernameController.text,
                emailController.text,
                passwordController.text,
              );
            }
      
          },
          child: Text('Create your account '),
        ),
      ],
    );

    
  }


}
