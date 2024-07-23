import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'firebase_options.dart';

import 'homepage.dart';
import 'log-hours.dart';

import 'dialogs/log-hours-dialog.dart';
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
  // final primaryBackground = Colors.blue;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
          // backgroundColor: primaryBackground,

body:  content(

),


// body: TableCalendar(
//         firstDay: DateTime.utc(2021, 1, 1),
//         lastDay: DateTime.utc(2022, 12, 31),
//         focusedDay: DateTime.now(),
//       ),
//       backgroundColor: primaryBackground,
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: Text('Agenda'),
//       )


   floatingActionButton: FloatingActionButton(
         onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return LogHoursDialog();
            },
          );
         }, 
  
        child: Icon(Icons.access_time),
        backgroundColor: Colors.blue,
        tooltip: 'Log Hours',
      ),

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

  // Table calendar widget

Widget  content() {
  return Column(
    
    children: [

      Container(
child: TableCalendar(
          focusedDay: DateTime.now(),

        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 3, 14),
        
      ),

      ),
    ]
  );
}




}


