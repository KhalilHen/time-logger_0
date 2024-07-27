import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';
import 'log-hours.dart';

import 'dialogs/log-hours-dialog.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
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

late FirebaseAuth auth;
User? currentUser;



late Stream<User?> autStateChanges;

@override 
void initState() {
  super.initState();

  auth = FirebaseAuth.instance;
  
  retrieveCurrentUser();
  getLoggedHours(); 
}

Future<void> retrieveCurrentUser() async {



    currentUser = auth.currentUser;

if(currentUser != null) {
  // TODO remove this later
  print(currentUser?.email);
} else {
  print('No user logged in');


 
  }
}
Future<void> getLoggedHours() async {
  if (currentUser != null) {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('LoggedHours')
          .where('userId', isEqualTo: currentUser!.uid)
          .orderBy('date', descending: true)
          .get();


      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final date = data['date']; 

        print(date);

      
        var isLogged = date;
      }
    }catch (err) {
      print('Unexpected error: ${err}');
    }
  }
}



  //
  @override
  Widget build(BuildContext context) {
   return Scaffold(
appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Agenda'),
      ),
body:  content(

),

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
      bottomSheet: Column(
        children: [

           ElevatedButton(onPressed: retrieveCurrentUser, child: Text('retrieve user'),
      
           ),


        ],
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
  return Padding(

padding: const EdgeInsets.all(20),

child: Container(
  child:  TableCalendar(


          focusedDay: DateTime.now(),

        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 3, 14),
       
        eventLoader: (day ) {
     
          return [
if(day == isLogged)


          
  BoxDecoration(
    color: Colors.blue,
    shape: BoxShape.circle
  )

          ];
        },
        
      ),

)

  );
}




}


