
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
class LogHoursDialog extends StatefulWidget {
 const LogHoursDialog({Key? key}) : super(key: key);
  @override
 _LogHoursDialogState createState() => _LogHoursDialogState();
}



class _LogHoursDialogState extends State<LogHoursDialog> {
 final _formKey = GlobalKey<FormState>();
 final hoursController = TextEditingController();
final descriptionController = TextEditingController();
final dateController = TextEditingController();



late FirebaseAuth auth;
User? currentUser;



// final user = Rxn<User>();

late Stream<User?> autStateChanges;



@override 
void initState() {
  super.initState();

  auth = FirebaseAuth.instance;
  
  getCurrentUser();
}
// TODO retrieve the user id
void  getCurrentUser() async {
    currentUser = auth.currentUser;


  
}


void  logHours() {

if(_formKey.currentState!.validate()) {
  final hours = hoursController.text;
  final description = descriptionController.text;
  final date = dateController.text;

 try {
 
  if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User is not authenticated')),
        );
        return;
      }


CollectionReference loggedHours = FirebaseFirestore.instance.collection('LoggedHours');

loggedHours.add({
  'hours': hours,
  'description': description,
  'date': date,
  'userId': currentUser!.uid,
  'userLogged': currentUser!.email,

}).then((_) {
  Navigator.of(context).pop();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hours logged')));

});

 }


 
 catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logging hours failed: $e')));

}

}
  
}

Future<void> selectDate() async {

  DateTime? picked =  await  showDatePicker(context: context,
  
  
  initialDate: DateTime.now(),
  firstDate: DateTime(2024),
  lastDate: DateTime(2040),
  );
if(picked != null) {
  setState(() {
    dateController.text = picked.toString().split(' ')[0];
  });



}
}

@override  


Widget build(BuildContext context) {
 return AlertDialog(
   title: const Text('Log hours'),
   content: Form(
     key: _formKey,
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         TextFormField(
           controller: hoursController,
           keyboardType: TextInputType.number,
           decoration: const InputDecoration(labelText: 'Hours',
           hintText: 'Enter the hours'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter the hours';
             }
             else if(value == String) {

              return 'Please enter a number';
             }
             return null;
           },
         ),
         TextFormField(

           controller: descriptionController,
           decoration: const InputDecoration(labelText: 'Description'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter a description';
             }
             return null;
           },
         ),
         TextFormField(
           controller: dateController,
           decoration: const InputDecoration(labelText: 'Date',
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: 
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)
          
          
          
          ),
          
          ),
       readOnly: true,
           onTap: selectDate,
         ),
       ],
     ),
   ),
   actions: <Widget>[
     TextButton(
       onPressed: () {
         Navigator.of(context).pop();
       },
       child: const Text('Cancel'),
     ),
     TextButton(
       onPressed: () {

        logHours();
         if (_formKey.currentState!.validate()) {
           Navigator.of(context).pop();
         }
       },
       child: const Text('Log'),
     ),
   ],
 );

}
}