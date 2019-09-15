import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User testUser;
  bool isFetching = false;
  int rng;

  List<String> mockFunFacts = [
    "Excise tax for the State Treasury – 18,8 mld PLN in 2017",
    "Taxes (including VAT and excise tax) currently constitute slightly above 80"
        " percent of the price of a packetof cigarettes in Poland",
    "Tobacco value of agri-food exports – 11% ( Higher was recorded only in trade in meat and meat products )",
    "Almost 25% of Polish population are smokers",
    "Almost 9 mln Poles smokes every day cigarettes ( 1 person – 17 cigarettes)",
    "Numbers of cigarette sold globally annually : 5,6 trillions",
    "Weight of cigarette butt – 0,17 g",
    "Weight of cigarette butts sold in the world- 952 000 t",
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
    setState(() {});
  }

  @override
  void initState() {
    testUser = new User("Hanzellberg", "assets/prince.png", 0);
    fetchStoredButts();
    rng = new Random().nextInt(mockFunFacts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Wrap(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 52, right: 32, left: 32, bottom: 24),
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
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text('Random fact',  style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.right,),
                            Text(
                              mockFunFacts[rng],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: FlatButton.icon(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  onPressed: () {},
                  icon: Icon(
                    Icons.pin_drop,
                    color: Colors.white.withOpacity(0.9),
                    size: MediaQuery.of(context).size.height*0.04,
                  ),
                  label: Text(
                    "BUTTS DROP",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
