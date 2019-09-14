import 'package:flutter/material.dart';

import 'package:eco_cigarettes/screens/mainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EcoCigg',
        theme: ThemeData(
        canvasColor: Color.fromRGBO(241, 242, 246, 1),
    ),
    initialRoute: MainScreen.routeName,
    routes: {
    MainScreen.routeName : (context) => MainScreen()
    },
    );
  }
}
