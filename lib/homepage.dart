import 'package:flutter/material.dart';






class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
      final primaryBackground = Colors.blue;

  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: primaryBackground,

      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Home Page'),
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
  // alignment: Alignment.center,        
       child: Column(
        
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


Text('Welcome',



  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  ),
),

SizedBox(height: MediaQuery.of(context).size.height * 0.1),


// Worked hours row structure
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

children: [
  Text('Worked hours',
  
  
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  ),
  ),
  Text("5/30")

],

),
// TODO Work here later on
Row(
children: [
  Text('Earned'),
],

)
       ],),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_bottom),
            label: 'log hours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Agenda',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      )
    
    );
  }
}

