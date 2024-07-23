import 'package:flutter/material.dart';

import 'firebase_options.dart';

import 'homepage.dart';
import 'agenda.dart';
class LogHours extends    StatelessWidget {
  const LogHours({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      title: 'Log-hours',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogHoursPage(),
    );

  }
} 

class LogHoursPage extends StatefulWidget {
  @override
  _LogHoursState createState() => _LogHoursState();
}



class _LogHoursState extends State<LogHoursPage> {

  int currentIndex = 1;
  final primaryBackground = Colors.blue;

  @override
  Widget build(BuildContext context) {
   return Scaffold(





    bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          switch (index) {
            case 0:
     Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 1:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LogHoursPage(),
                ),
              );
              break;
            case 2:
              // Handle Lists tap


              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  AgendaPage(),
                )
                );
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: 'Log hours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Agenda',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    
   );	
  }


}


