import 'package:flutter/material.dart';
import 'package:eco_cigarettes/model/Inspiration.dart';
import 'package:eco_cigarettes/article.dart';

class InspirationPage extends StatefulWidget {
InspirationPage({Key key, this.title}) : super(key: key);

final String title;

@override
_InspirationPageState createState() => _InspirationPageState();
}

class _InspirationPageState extends State<InspirationPage> {
  List inspirations;
  TextStyle _topBarStyle = TextStyle(color: Colors.black54);

  @override
  void initState() {
    inspirations = getInspirations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Inspiration inspiration) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      title: Text(
        inspiration.title,
        style: TextStyle(
            fontFamily: 'FiraSans',
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow( // bottomLeft
                  offset: Offset(-0.3, -0.3),
                  color: Colors.black
              ),
              Shadow( // bottomRight
                  offset: Offset(0.3, -0.3),
                  color: Colors.black
              ),
              Shadow( // topRight
                  offset: Offset(0.3, 0.3),
                  color: Colors.black
              ),
              Shadow( // topLeft
                  offset: Offset(-0.3, 0.3),
                  color: Colors.black
              ),]),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
      Column(
      children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 45.0)),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(inspiration.date + '  ' + inspiration.author,
                  style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      )),
          ),
        )
      ],
      ),
        ],
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleScreen(inspiration : inspiration)));
      },
    );

    Card makeCard(Inspiration inspiration) => Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Container (
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
            inspiration.image),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,

      ),
      ), 
        child: makeListTile(inspiration),
//        child: Text(
//          'Test',
//        style: TextStyle(color: Colors.white,
//            fontFamily: 'FiraSans',
//            fontWeight: FontWeight.bold),
//        ),
      ),

    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: inspirations.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(inspirations[index]);
        },
      ),
    );


    final topAppBar = AppBar(
      centerTitle: true,
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Text('Inspirations',
      style: _topBarStyle),
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

List getInspirations() {
  return [
    Inspiration(
        author: 'Agatha C.',
        date: '2019-09-10',
        content: 'tekst',
        image: "assets/spraying.png",
        title: 'Spraying flowers with tobacco water'),
    Inspiration(
        author: 'Mark Z.',
        date: '2019-09-01',
        content: 'tekst',
        image: "assets/supercapacitor.jpg",
        title: 'Transform butts into supercapacitors'),
    Inspiration(
        author: 'Maggie B.',
        date: '2019-08-30',
        content: 'tekst',
        image: "assets/deposit.jpeg",
        title: 'Pay deposit for each packet of cigarettes'),
  ];
}
