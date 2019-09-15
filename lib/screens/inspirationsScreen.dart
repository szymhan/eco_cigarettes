import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/Inspiration.dart';
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

    final makeFloatingButton =  FloatingActionButton(
    onPressed: () {
    // Add your onPressed code here!
    },
    child: Icon(Icons.plus_one),
    backgroundColor: Colors.deepOrange,
    );

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: topAppBar,
      body: makeBody,
      floatingActionButton: makeFloatingButton,
    );
  }
}

List getInspirations() {
  return [
    Inspiration(
        author: 'Fenghu Z.',
        date: '2019-10-03',
        content: 'A campaign to keep the streets in Xianyang, Shaanxi province clean by offering residents cold hard cash for each discarded cigarette butt they pick up in urban areas has erupted in a dispute, but local leaders are sticking to their principles.\nIn the past month, loyal citizens have handed over a total of 7 million cigarette butts to the government and more than 100,000 yuan has been paid out for 2 million of the undesirable things. A shortage of funds has kept the other 5 million butts from being paid for.',
        image: "assets/collecting.png",
        title: 'Exchange butts for real cash'),
    Inspiration(
        author: 'Agatha C.',
        date: '2019-09-10',
        content: 'Nicotine sprays are a traditional remedy for a range of pests, including whiteflies, gnats, root and leaf aphids, thrips and leafminers. While commercial nicotine sprays are so potent that they can kill as many beneficial insects as plant predators, homemade "tobacco juice" is short-lived and much milder. Used sparingly, it may be an important member in your arsenal of natural pest control.',
        image: "assets/spraying.png",
        title: 'Spraying flowers with tobacco water'),
    Inspiration(
        author: 'Mark Z.',
        date: '2019-09-01',
        content: 'The material inside cigarette filters is a synthetic fiber called cellulose acetate that, when heated in the presence of nitrogen, turns into a carbon-based material full of pores. The pores contribute to its high surface area, making it good for supercapacitors. When the team tested it for how well it charged and discharged electrons, they found it worked better than commercially available materials—as well as graphene and carbon nanotubes, as reported in previous studies.',
        image: "assets/supercapacitor.jpg",
        title: 'Transform butts into supercapacitors'),
    Inspiration(
        author: 'Maggie B.',
        date: '2019-08-30',
        content: 'A Berliner has launched a petition demanding a deposit of 20 cent on every cigarette sold in Germany in a bid to reduce litter and environmental pollution.\nEach day more than 200 million cigarettes are smoked in Germany and the vast majority end up on the street, in parks and, sooner or later, in our waterways,” he writes in the petition. “I’m sure that, with a deposit, we would sideline around 90 per cent of all butts.”\nHis proposal would see a €4 surcharge on a pack of cigarettes, refundable if the smoker returns the package with all butts inside. One idea is to force cigarette companies to redesign their packaging to include mobile, sealable ashtrays for ash and cigarette butts. The pack/ashtray could be reusable and should be subject to a deposit, suggests Mr Von Orlow.',
        image: "assets/deposit.jpeg",
        title: 'Pay deposit for each packet of cigarettes'),
  ];
}
