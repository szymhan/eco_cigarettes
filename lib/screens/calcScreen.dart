import 'package:flutter/material.dart';
import 'package:eco_cigarettes/models/time.dart';
import 'package:eco_cigarettes/models/pollution.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


//I know that this code is ugly, I'm fully ashamed of it :(

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final myPeopleCountTextController = TextEditingController();
  final mySingleActionTimeTextController = TextEditingController();

  bool isSwitched = false;
  int peopleCount = 1;
  var actionTimeMin = 30;
  double litersOfCigaretsButts = 0;
  int buttsNumber = 0;
  double litersOfSeaWater = 0;
  double plasticWaste = 0;

  List<Time> _periods = Time.getPeriods();
  List<DropdownMenuItem<Time>> _dropdownPeriodMenuItems;
  Time _selectedPeriod;

  List<PollutionLevel> _pollutionLevels = PollutionLevel.getPollutionLevel();
  List<DropdownMenuItem<PollutionLevel>> _dropdownPollutionLevelMenuItems;
  PollutionLevel _selectedPollutionLevel;

  saveTotalButts() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    int totalButts = preferences.getInt("total-butts") ?? 0;
    preferences.setInt("total-butts", this.buttsNumber + totalButts);
  }


  @override
  void initState() {
    _dropdownPeriodMenuItems = buildDropdownPeriodMenuItems(_periods);
    _selectedPeriod = _dropdownPeriodMenuItems[0].value;

    _dropdownPollutionLevelMenuItems = buildDropdownPollutionLevelMenuItems(_pollutionLevels);
    _selectedPollutionLevel = _dropdownPollutionLevelMenuItems[2].value;

    myPeopleCountTextController.addListener(updatePeopleCount);
    myPeopleCountTextController.text = "1";

    mySingleActionTimeTextController.addListener(updateMinutesCount);
    mySingleActionTimeTextController.text = "30";
    
    super.initState();
  }
///////////
  List<DropdownMenuItem<Time>> buildDropdownPeriodMenuItems(List periods) {
    List<DropdownMenuItem<Time>> items = List();
    for(Time period in periods) {
      items.add(
        DropdownMenuItem(
          value: period,
          child: Text(period.period),
        )
      );
    }
    return items;
  }

  onChangeDropdownItem(Time selectedPeriod) {
    setState(() {
      _selectedPeriod = selectedPeriod;
      calculateTotal();
    });
  }
//////////////////
  List<DropdownMenuItem<PollutionLevel>> buildDropdownPollutionLevelMenuItems(List pollutions) {
    List<DropdownMenuItem<PollutionLevel>> items = List();
    for(PollutionLevel level in pollutions) {
      items.add(
          DropdownMenuItem(
            value: level,
            child: Text(level.name),
          )
      );
    }
    return items;
  }

  onChangePollutionLevelDropdownItem(PollutionLevel pollutionLevel) {
    setState(() {
      _selectedPollutionLevel = pollutionLevel;
      calculateTotal();
    });
  }

////////////
  List _buildList(int count) {
    List<Widget> listItems = List();

    listItems.add(new Padding(
        padding: new EdgeInsets.only(left: 20, right: 20, top: 40), child: numberOfPeople()), );

    listItems.add(new Padding(
        padding: new EdgeInsets.symmetric(horizontal: 20), child: singleOrRegular()), );

    listItems.add(new Padding(
        padding: new EdgeInsets.symmetric(horizontal: 20), child: timeSpent()), );

    if(isSwitched) {
      listItems.add(new Padding(
          padding: new EdgeInsets.symmetric(horizontal: 20),
          child: periodOfCleaning()),);
    }

      listItems.add(new Padding(
          padding: new EdgeInsets.symmetric(horizontal: 20), child: pollutionLevel()), );

      listItems.add(new Padding(
          padding: new EdgeInsets.symmetric(horizontal: 15), child: resultCard()), );

      return listItems;
    }

  ////

  Widget singleOrRegular() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Single action/Regular action:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                      calculateTotal();
                    },
                    activeTrackColor: Colors.orangeAccent,
                    activeColor: Colors.orange,
                  )
                ]),
          ),
        )),
      ),
    );
  }
  Widget periodOfCleaning() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Period of cleaning: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      DropdownButton(
                        value: _selectedPeriod,
                        items: _dropdownPeriodMenuItems,
                        onChanged: onChangeDropdownItem,
                      )
                    ]),
              ),
            )),
      ),
    );
  }

  Widget resultCard() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.insert_chart, size: 65, color: Colors.orangeAccent,),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('RESULTS', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("In such time you should be able to gather " + litersOfCigaretsButts.toStringAsFixed(1) + " liters of butts"
              + "\n" + "That's equals to " + buttsNumber.toString() + " butts!"
              + "\n\n" + "Earth will thank you! These results means that: "+ "\n\n\n"
              + "1. You'll prevent pollution of  " + litersOfSeaWater.toStringAsFixed(0) + " liters of sea water!" + "\n\n"
              + "2. You'll also prevent of storage " + plasticWaste.toStringAsFixed(2) + " kg of plastic waste!"
              + "\nYou can be proud!\n",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
        side: BorderSide(width: 1)
      ),
    );
  }

  Widget pollutionLevel() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Pollution level: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      DropdownButton(
                        value: _selectedPollutionLevel,
                        items: _dropdownPollutionLevelMenuItems,
                        onChanged: onChangePollutionLevelDropdownItem,
                      )
                    ]),
              ),
            )),
      ),
    );
  }

  Widget timeSpent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Single action time in minutes: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Container(
                        width: 35,
                        child: TextField(
                          controller: mySingleActionTimeTextController,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                        ),
                      ),
                    ]),
              ),
            )),
      ),
    );
  }

  Widget numberOfPeople() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).backgroundColor.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                      SizedBox(child:
                Text("Number of people:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
//                        , width: MediaQuery.of(context).size.width*0.3,),
//                      SizedBox(
//                      width: MediaQuery.of(context).size.width*0.4,
//                      ),
                Container(
                  width: 25,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                    controller: this.myPeopleCountTextController,
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  updatePeopleCount() {
    String peopleText = myPeopleCountTextController.value.text;
    int peoplenumber = 1;
    if(peopleText != '') {
      peoplenumber = int.parse(peopleText);
    }
      peopleCount = peoplenumber;
      print("peopleCount: " + peopleCount.toString());
      calculateTotal();
    }

  updateMinutesCount() {
    String minutesText = mySingleActionTimeTextController.value.text;
    int peoplenumber = 1;
    if(minutesText != '') {
      peoplenumber = int.parse(minutesText);
    }
    actionTimeMin = peoplenumber;
    print("actiiontime: " + actionTimeMin.toString());
      calculateTotal();
  }


    calculateTotal() {
    int butts;
      switch(this._selectedPollutionLevel.level) {
        case 4: {
          butts = ((peopleCount * actionTimeMin * 40)/60).round();
          if(isSwitched) {
            butts = butts * _selectedPeriod.time;
          }
          break;}
        case 3: {
          butts = ((peopleCount * actionTimeMin * 145)/60).round();
          if(isSwitched) {
            butts = butts * _selectedPeriod.time;
          }
          break;}
        case 2: {
          butts = ((peopleCount * actionTimeMin * 375)/60).round();
          if(isSwitched) {
            butts = butts * _selectedPeriod.time;
          }
          break;}
        case 1: {
          butts = ((peopleCount * actionTimeMin * 500)/60).round();
          if(isSwitched) {
            butts = butts * _selectedPeriod.time;
          }
          break;}
      }

      this.buttsNumber = butts;
      this.litersOfSeaWater = butts*0.8;
      this.litersOfCigaretsButts = butts/170;
      this.plasticWaste = (butts*0.000173826);

      setState(() {

      });

      print("waste: " + plasticWaste.toString());
    }



  @override
  void dispose() {
    this.myPeopleCountTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Calculator"
              "", style: TextStyle(color: Colors.black54),),
          elevation: 0.1,
          backgroundColor: Colors.white
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(delegate: new SliverChildListDelegate(_buildList(50))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveTotalButts();
        },
        child: Icon(FontAwesomeIcons.shareSquare),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
