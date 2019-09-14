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
            ),
        ),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
         Text(inspiration.title,
             textAlign: TextAlign.center,
             style: TextStyle(
               fontWeight: FontWeight.bold,
             fontFamily: 'GentiumBookBasic',
             fontSize: 30)
           ,),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            SizedBox(
              width: double.infinity,
              child: Text('by ' + inspiration.author,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'GentiumBookBasic',
                      fontSize: 15)),
            ),
      const Padding(padding: EdgeInsets.only(top: 5.0)),
      SizedBox(
        width: double.infinity,
        child: Text(inspiration.date,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'GentiumBookBasic',
                fontSize: 15))),
          const Padding(padding: EdgeInsets.only(top: 35.0)),
      Expanded(
        child: SingleChildScrollView(
          child: Text(inspiration.content,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontWeight: FontWeight.normal,

                fontFamily: 'GentiumBookBasic',
                fontSize: 22)
            ,),
        ),
      ),
          ],
        ),
      ),
    );
  }

}


