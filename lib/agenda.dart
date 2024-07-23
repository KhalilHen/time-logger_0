import 'package:flutter/material.dart';

import 'firebase_options.dart';

import 'homepage.dart';
import 'log-hours.dart';
class Agenda extends    StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      title: 'Agenda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AgendaPage(),
    );

  }
} 

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}



class _AgendaPageState extends State<AgendaPage> {

  int currentIndex = 2;
  final primaryBackground = Colors.blue;

  @override
  Widget build(BuildContext context) {
   return Scaffold(





























// Bottom nav
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


