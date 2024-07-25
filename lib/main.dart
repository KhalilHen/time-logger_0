import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'firebase_options.dart';
import 'homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'sign-up.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp(MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final EmailAndUsernameController = TextEditingController();
  final emailController = TextEditingController();
final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>(); 
// final db = FirebaseFirestore.instance;?
     final db = FirebaseFirestore.instance;

  var  passwordVisible;

@override
  void initState() {
    passwordVisible = false;
  }

  Future<void> _checkForUsername(BuildContext context) async {


      //  final usersFind = db.collection('users').where('username', isEqualTo: usernameController.text).get();

//  

db.collection('users').where('username', isEqualTo: usernameController.text).get().then((QuerySnapshot querySnapshot) {
  querySnapshot.docs.forEach((doc) {
    print(doc["username"]);
  });
});

// final query = usersFind.where('username', isEqualTo: usernameController.text).get();
  }

  Future<void> _login(BuildContext context) async {
    if (_key.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        username: usernameController.text,  
          email: emailController.text,
          password: passwordController.text,
   
   
   
   
   
   
        );


     

        final docRef = db.collection('users').doc(userCredential.user!.uid);
        docRef.get().then((DocumentSnapshot doc ){



// 
final data = doc.data() as Map<String, dynamic>;

if (data['username'] == usernameController.text) {
        }

 Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );

        }
        
       , onError: (e) {
          print('Error: $e');
       } 
        );

// TODO Add here also check for username via firebase collection



         if (userCredential.user != null) {
          print('Login successful');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          print('Oops there went something wrong');
        }
      } catch (e) {
        print('Login failed: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }

  _signUp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryBackground = Colors.blue;

    return Scaffold(
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
                    // controller: emailController, usernameController,
                    controller: EmailAndUsernameController,
                    validator: validateEmail,
                    decoration: const InputDecoration(
                      labelText: 'Enter email or username' ,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),

                child: TextFormField(
                    obscureText: !passwordVisible,
                    controller: passwordController,
                    validator: validatePassword,
                    decoration:  InputDecoration(
                      labelText: 'Enter password',
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
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _login(context),
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
               onPressed: () => _signUp(context),

                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {


Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(builder: (context) => HomePage()),
                        // );
                      },
                      child: Text('Home page redirect'),
                    ),
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

RegExp pattern = RegExp(r'^[\s\S]{8,}$'); // At least 8 characters

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) return 'Invalid Email address';
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) return 'Invalid password';
  return null;
}
