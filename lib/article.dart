import 'package:flutter/material.dart';
import 'package:eco_cigarettes/model/Inspiration.dart';


class ArticleScreen extends StatelessWidget {
  final Inspiration inspiration;

  ArticleScreen({Key key,@required this.inspiration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50.0)),
           ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child:Container (
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      inspiration.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,

                ),
              ),
//        child: Text(
//          'Test',
//        style: TextStyle(color: Colors.white,
//            fontFamily: 'FiraSans',
//            fontWeight: FontWeight.bold),
//        ),
            ),
        ),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
         Text(inspiration.title),
            Text('by ' + inspiration.author),
            Text(inspiration.date),
          const Padding(padding: EdgeInsets.only(top: 45.0)),
            Text(inspiration.content),
          ],
        ),
      ),
    );
  }

}


