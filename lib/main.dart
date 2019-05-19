import 'package:attraction_info/pages/items.dart' as prefix0;
import 'package:attraction_info/test/screens.dart';
import 'package:attraction_info/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:attraction_info/test/home_test.dart';
import 'package:attraction_info/test/learn.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFF1A237E)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Attraction_Info ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                       return mainView();
                     }));
                      },
                        padding: const EdgeInsets.only(left:0.0, right:0, top: 0.0),
                        //padding: const EdgeInsets.only(left:10.0, right:20, top: 10.0),
                        child: new Container(
                          alignment: Alignment.center,
                          height: 70.0,
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            //borderRadius: new BorderRadius.circular(10.2),
                            ),
                            child: new Text(
                              'Start',
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                ),
                              ),
                            ),
                       
                      ),
                    Text(
                      "View the attractions and select the one you want to view",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}