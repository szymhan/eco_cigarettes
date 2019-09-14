import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eco_cigarettes/model/event.dart';

class EventsScreen extends StatefulWidget {
  static const routeName = 'events-screen';
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List events;

  @override
  void initState() {
    events = getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    ListTile makeListTile(Event event) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading:  Container(
          width: 190.0,
          height: 190.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(
                      event.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,

                ),
              )
          ),
      title: Text(
        event.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 15.0)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(event.date,
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                  )),
            ),
          ),Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(event.address,
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                  )),
            ),
          ),
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    );

    Card makeCard(Event event) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(event),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 50.0)),
              IconButton (iconSize: 70,
                  color: Colors.orange,
                  icon: Icon(
                FontAwesomeIcons.facebook,
              ), onPressed: (){

              }),
              const Padding(padding: EdgeInsets.only(top: 50.0)),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) {
                  return makeCard(events[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );


  }


}


List getEvents() {
  return [
    Event(
        address: 'Siedlce',
        date: '2019-09-30',
        image: "assets/trash.png",
        title: '3. Wspólne Zbieranie Śmieci w Siedlcach',
        url: 'https://www.facebook.com/events/704778479971352/'),
    Event(
        address: 'Warszawa',
        date: '2019-10-10',
        image: "assets/trash.png",
        title: 'Spraying flowers with tobacco water',
        url: 'https://www.facebook.com/events/704778479971352/'),
    Event(
        address: 'Żyrardów',
        date: '2019-10-04',
        image: "assets/trash.png",
        title: 'Spraying flowers with tobacco water',
        url: 'https://www.facebook.com/events/704778479971352/'),
  ];
}

