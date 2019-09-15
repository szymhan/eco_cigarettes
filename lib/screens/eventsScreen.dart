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
      leading:  ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: Container(
          width: 60.0,
          height: 60.0,
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(

              image: new DecorationImage(
                  image: AssetImage(
                      event.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,

                ),
              )
          ),),
      title: Text(
        event.title,
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(event.date +'\n' + event.address,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black54,
                    fontSize: 16,
                  )),
        ],
      ),
      trailing:
      Icon(FontAwesomeIcons.facebookSquare, color: Color.fromRGBO(158, 202, 232, 1), size: 30.0),
    );

    Card makeCard(Event event) => Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(color: Color.fromRGBO(241, 242, 246, .9)),
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
              Text('See events',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontFamily: 'FitaSans',
              ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
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
        image: "assets/trash3.png",
        title: 'Spacer połączony ze zbieraniem śmieci',
        url: 'https://www.facebook.com/events/2686611354700383/'),
    Event(
        address: 'Elbląg',
        date: '2019-10-04',
        image: "assets/trash2.png",
        title: 'Zbieranie śmieci z brzegów Polskich Wód',
        url: 'https://www.facebook.com/events/247016369573046/'),
    Event(
        address: 'Kraków',
        date: '2019-10-07',
        image: "assets/trash4.png",
        title: 'Plogging Kraków czyli bieganie + zbieranie śmieci z Nauka Biega',
        url: 'https://www.facebook.com/events/431508154327298/'),
  ];
}

