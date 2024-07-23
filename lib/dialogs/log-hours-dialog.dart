import 'package:flutter/material.dart';





class LogHoursDialog extends StatefulWidget {
  const LogHoursDialog({Key? key}) : super(key: key);
  @override
  _LogHoursDialogState createState() => _LogHoursDialogState();
}


class _LogHoursDialogState extends State<LogHoursDialog> {
  final _formKey = GlobalKey<FormState>();
  final _hoursController = TextEditingController();

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
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the hours';
                }
                return null;
              },
            ),
         
          ],
        ),
      ),
  
    );
  }
}