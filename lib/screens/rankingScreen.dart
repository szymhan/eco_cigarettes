import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/User.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<User> mockUsers = [
  new User("You - Mark Z.", "assets/prince.png", 9925),
  new User("Simon B.", "assets/avatar1.png", 8521),
  new User("Leo M.", "assets/avatar2.png", 8210),
  new User("Lambert FF.", "assets/avatar3.png", 6501),
  new User("Carol Z.", "assets/avatar4.png", 5513),
  new User("Jeff B.", "assets/avatar5.png", 4896),
  new User("Steve W.", "assets/avatar6.png", 4756),
//  new User("OPOOOooO12", "assets/prince.png", 3542),
//  new User("Wojtus12", "assets/prince.png", 2541),
];

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Ranking", style: TextStyle(color: Colors.black54),),
        elevation: 0.1,
          backgroundColor: Colors.white
      ),
      body: Container(
          child: makeBody,
      ),
    );
  }
}
final makeBody = Container(
  color: Colors.white,
  child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: mockUsers.length,
    itemBuilder: (BuildContext context, int index) {
      return makeCard(index);
    },
  ),
);

 makeCard(int index) {
   return Card(
     semanticContainer: true,
     clipBehavior: Clip.antiAliasWithSaveLayer,
     elevation: 8.0,
     margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(25.0),
     ),
     child: Container(
       decoration: BoxDecoration(color: Colors.orange,),
       child: makeListTile(index),
     ),
   );
 }


makeListTile(int index) {
 return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      leading: Container(
        width: 60,
//        padding: EdgeInsets.only(right: 12.0),
        //child: Icon(FontAwesomeIcons.userCircle, color: Colors.white, size: 40,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          image: DecorationImage(
            image: AssetImage(mockUsers[index].avatar),
          ),
        ),
      ),
      title: Text(
        mockUsers[index].username,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                image: AssetImage(mockUsers[index].avatar),
              ),
            ),
          ),
          index==0 ?
          Text("You've " + mockUsers[index].buttsCollected.toString() + " butts total", style: TextStyle(color: Colors.white))
              :Text("Buts total: " + mockUsers[index].buttsCollected.toString(), style: TextStyle(color: Colors.white))
        ],
      ),
      trailing:
      Text((index+1).toString()+".", style: TextStyle(color: Colors.white, fontSize: 32)),
 );
}