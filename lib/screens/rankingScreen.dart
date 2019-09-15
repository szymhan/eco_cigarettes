import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/User.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<User> mockUsers = [
  new User("You - Hanzellberg", "assets/prince.png", 9925),
  new User("Han Szyn", "assets/prince.png", 8521),
  new User("File Lehow", "assets/prince.png", 8210),
  new User("Lambert Filew", "assets/prince.png", 6501),
  new User("Twojja Starra", "assets/prince.png", 5513),
  new User("Mauppa Gorrlla", "assets/prince.png", 4896),
  new User("Korwinnnum Procentum", "assets/prince.png", 4756),
  new User("OPOOOooO12", "assets/prince.png", 3542),
  new User("Wojtus12", "assets/prince.png", 2541),
];

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: makeBody,
      ),
    );
  }
}
final makeBody = Container(
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
       side: BorderSide(width: 1)
     ),
     child: Container(
       decoration: BoxDecoration(color: Colors.orange,),
       child: makeListTile(index),
     ),
   );
 }


makeListTile(int index) {
 return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
//        padding: EdgeInsets.only(right: 12.0),
        child: Icon(FontAwesomeIcons.userCircle, color: Colors.white, size: 40,),
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
              :Text("This username has " + mockUsers[index].buttsCollected.toString() + " butts collected", style: TextStyle(color: Colors.white))
        ],
      ),
      trailing:
      Text((index+1).toString(), style: TextStyle(color: Colors.white, fontSize: 32)),
 );
}