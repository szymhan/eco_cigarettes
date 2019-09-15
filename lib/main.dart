import 'package:flutter/material.dart';
import 'package:eco_cigarettes/screens/inspirationsScreen.dart';
import 'package:eco_cigarettes/screens/eventsScreen.dart';
import 'package:flutter/services.dart';
import 'screens/calcScreen.dart';
import 'screens/userProfileScreen.dart';
import 'screens/rankingScreen.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(MaterialApp(
    // Title
      title: "Using Tabs",
      theme: ThemeData(
        backgroundColor: Colors.white24,
      ),
      // Home
      home: MyApp()));
}
      );
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
    controller = TabController(length: 5, vsync: this);
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
        children: <Widget>[EventsScreen(), CalculatorScreen(), InspirationPage(), UserProfileScreen(), RankingScreen()],
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
                      width: 5,
                      color: Colors.orange
                      )
              )),
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.event,
                    color: Colors.orange),
              ),
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
              icon: Icon(Icons.person_outline,
                color: Colors.orange),
            ),Tab(
              icon: Icon(Icons.insert_chart,
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

