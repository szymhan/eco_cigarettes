import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/User.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  User testUser;

  @override
  void initState() {
    testUser = new User("Hanzellberg", "assets/prince.png", 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Container (
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      this.testUser.avatar),
                ),
              ),
//        child: Text(
//          'Test',
//        style: TextStyle(color: Colors.white,
//            fontFamily: 'FiraSans',
//            fontWeight: FontWeight.bold),
//        ),
            ),
          ],
        ),
      ),
    );
  }
}
