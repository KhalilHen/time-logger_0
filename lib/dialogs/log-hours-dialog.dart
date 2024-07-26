import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




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


// TODO retrieve the user id
User getCurrentUser() {
  
}

void  logHours() {

if(_formKey.currentState!.validate()) {
  final hours = hoursController.text;
  final description = descriptionController.text;
  final date = dateController.text;

 try {
 



CollectionReference loggedHours = FirebaseFirestore.instance.collection('LoggedHours');

loggedHours.add({
  'hours': hours,
  'description': description,
  'date': date,
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
           decoration: const InputDecoration(labelText: 'Hours'),
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
           decoration: const InputDecoration(labelText: 'Date'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter a date';
             }
             else if(value == String) {

              return 'Please enter number';
             }
             return null;
           },
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