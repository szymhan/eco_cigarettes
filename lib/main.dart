import 'package:flutter/material.dart';
import 'package:eco_cigarettes/screens/inspirationsScreen.dart';
import 'package:eco_cigarettes/screens/mainScreen.dart';
import 'screens/calcScreen.dart';

void main() {
  runApp(MaterialApp(
    // Title
      title: "Using Tabs",
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
    controller = TabController(length: 3, vsync: this);
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
        children: <Widget>[CalculatorScreen(), InspirationPage(), MainScreen()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(

        // set the color of the bottom navigation bar
        color: Colors.white24,
        // set the tab bar as the child of bottom navigation bar
        child: SafeArea(
          child: TabBar(
            indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 3,
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
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    ));
  }
}

