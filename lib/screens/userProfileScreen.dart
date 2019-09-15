import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User testUser;
  bool isFetching = false;
  int rng;

  List<String> mockFunFacts = [
    "Excise tax for the State Treasury = 18,8 mld PLN in 2017",
    "Taxes (incl. VAT and excise tax) currently constitute slightly above 80 % of the price of a packet of cigarettes",
    "Tobacco value of agri-food exports – 11% ( Higher was recorded only in trade in meat and meat products )",
    "Almost 25% of Polish population are smokers",
    "Almost 9 mln Poles smokes every day cigarettes ( 1 person = 17 cigarettes)",
    "Numbers of cigarette sold globally annually : 5,6 trillions",
    "Weight of cigarette butt = 0,17 g",
    "Weight of cigarette butts sold in the world = 952 000 t",
    "Weight of cigarettes littered annually up to 800 000 t",
    "Percentage of butts that are being littered – 84%",
    "4,7 trillion butts are littered per year - 150 000 butts are littered per second",
    "In 10 years there may be more cigarette butts in the ocean than fish",
    "Number of fish in the ocean : 3,5 trillion",
    "Filters take between 1 month and 15 years to biodegrade"

  ];

  fetchStoredButts() async {
    isFetching = true;
    Future.delayed(const Duration(milliseconds: 500));
    setState(() {});
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    int totalButts = preferences.getInt("total-butts") ?? 0;
    this.testUser.buttsCollected = totalButts;
    isFetching = false;
    setState(() {
    });
  }

  @override
  void initState() {
    testUser = new User("Mark Z.", "assets/prince.png", 0);
    fetchStoredButts();
    rng = new Random().nextInt(mockFunFacts.length);
  }

  @override
  Widget build(BuildContext context) {

    ListTile makeMapsTile() => ListTile(
      onTap: openMap,
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
                    'assets/maps.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,

              ),
            )
        ),),
      title: Text(
       'NAVIGATE\nTO NEAREST POINT',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87,
            fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
    );

    Card makeCard() => Card(
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
        child: makeMapsTile(),
      ),
    );


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Wrap(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, right: 32, left: 32, bottom: 24),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(this.testUser.avatar),
                    ),
                  ),
                ),
              ),
              Text(
                testUser.username,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: isFetching ? Center(
                          child: CircularProgressIndicator(),) : Column(
                            children: <Widget>[
                              Text(
                                "You've managed to gather",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  testUser.buttsCollected.toString(),
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                " cigarret butts for now!",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Good job, keep this up!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20.0)),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: SizedBox(
                          width: 280.0,
                          height: 150.0,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Did you know, that...',
                              style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey
                            ),
                            textAlign: TextAlign.center,),
                            const Padding(padding: EdgeInsets.only(top: 10.0)),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                            child: Text(
                              mockFunFacts[rng],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Text('Want to return cigarette butts?',
              style: TextStyle(
                  fontStyle:  FontStyle.italic),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 280.0,
                    height: 100.0,
                    child: makeCard()
              ),
              ),
            ],
          ),
        ],
      ),

    );
  }

  static openMap() async {
    String googleUrl = 'https://www.google.com/maps/place/Urz%C4%85d+Miasta+Sto%C5%82ecznego+Warszawy/@52.243016,21.00042,15z/data=!4m5!3m4!1s0x0:0x3456bc63ac8f2fe6!8m2!3d52.243016!4d21.00042';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
