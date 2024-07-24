import 'package:flutter/material.dart';




class LogHoursDialog extends StatefulWidget {
 const LogHoursDialog({Key? key}) : super(key: key);
  @override
 _LogHoursDialogState createState() => _LogHoursDialogState();
}



class _LogHoursDialogState extends State<LogHoursDialog> {
 final _formKey = GlobalKey<FormState>();
 final _hoursController = TextEditingController();
final _descriptionController = TextEditingController();
final _dateController = TextEditingController();

void  logHours() {

if(_formKey.currentState!.validate()) {
//  try {}

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
           controller: _hoursController,
           decoration: const InputDecoration(labelText: 'Hours'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter the hours';
             }
             return null;
           },
         ),
         TextFormField(
           controller: _descriptionController,
           decoration: const InputDecoration(labelText: 'Description'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter a description';
             }
             return null;
           },
         ),
         TextFormField(
           controller: _dateController,
           decoration: const InputDecoration(labelText: 'Date'),
           validator: (value) {
             if (value == null || value.isEmpty) {
               return 'Please enter a date';
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