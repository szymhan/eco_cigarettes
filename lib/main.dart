import 'package:flutter/material.dart';
import 'package:eco_cigarettes/screens/inspirationsScreen.dart';
import 'package:eco_cigarettes/screens/eventsScreen.dart';
import 'package:flutter/services.dart';
import 'screens/calcScreen.dart';
import 'screens/userProfileScreen.dart';


void main() {
  runApp(MaterialApp(
    // Title
      title: "Using Tabs",
      theme: ThemeData(
        backgroundColor: Colors.white24,
      ),
      // Home
      home: MyApp()));
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin  {

  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  TabBarView(

        // Add tabs as widgets
        children: <Widget>[CalculatorScreen(), InspirationPage(), EventsScreen(), UserProfileScreen()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(

        // set the color of the bottom navigation bar
        // set the tab bar as the child of bottom navigation bar
        child: SafeArea(
          child: TabBar(
            indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 4,
                      color: Colors.orange
                      )
              )),
            tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.exposure,
                color: Colors.orange,),
            ),
            Tab(
              // set icon to the tab
              icon: Icon(Icons.lightbulb_outline,
              color: Colors.orange,),
            ),
            Tab(
              icon: Icon(Icons.event,
                color: Colors.orange),
            ),Tab(
              icon: Icon(Icons.person_outline,
                color: Colors.orange),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    ));
  }
}

