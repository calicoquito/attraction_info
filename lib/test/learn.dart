import 'package:attraction_info/pages/items.dart';
import 'package:attraction_info/main.dart';
import 'package:attraction_info/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:attraction_info/test/screens.dart';
import 'package:attraction_info/test/test.dart';



//void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     title: 'App Beta 1',
     home:BasicUi() 
     );
  }
}
class RandomWordState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Word Generator'),
       ),
       body: _buildSuggestions(),
     );    
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return Divider();
        final index  = 1 ~/ 2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );

  }

  Widget _buildRow(WordPair pair){
    return Container(
      child: Center(
        child: Text(pair.asPascalCase,
        style: _biggerFont),
      ),
    );
    // return ListTile(
    //   title: Text(
    //     pair.asPascalCase,
    //   style: _biggerFont),
    // );
  }

}

class RandomWords extends StatefulWidget {
  RandomWords({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  RandomWordState createState() => RandomWordState();
}

// class RandomWords extends StatefulWidget{

//   @override
//   RandomWordState crerateState() => new RandomWordState();

// }

class BasicUi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Container(
                  height: 60.0,
                  width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color:Colors.green,
                ),
                child : new Icon (Icons.home, color:Colors.white),
                ),
                new Container(
                margin: new EdgeInsets.only(right: 50.0, top:60.0),
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color:Colors.red,
                ),
                child : new Icon (Icons.local_offer, color:Colors.white),
              ),
               new Container(
                margin: new EdgeInsets.only(left: 30.0, top:60.0),
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color:Colors.yellow,
                ),
                child : new Icon (Icons.local_car_wash, color:Colors.white),
              ),
               new Container(
                margin: new EdgeInsets.only(left: 100.0, top:0.0),
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color:Colors.blue,
                ),
                child : new Icon (Icons.place, color:Colors.white),
              ),
               new Container(
                margin: new EdgeInsets.only(left: 130.0, top:60.0),
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(50.0),
                  color:Colors.orange,
                ),
                child : new Icon (Icons.account_box, color:Colors.white),
              ),
            ], 
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:5.0,bottom: 80.0,left:20.0)
                ),
                new Text('Basic Ui',
                  style: new TextStyle(fontSize: 30.0),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                       return mainView();
                     }));
                    },
                    padding: const EdgeInsets.only(left:20.0, right:20, top: 10.0),
                    child: new Container(
                      alignment: Alignment.center,
                      height: 70.0,
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        borderRadius: new BorderRadius.circular(10.2),
                        ),
                        child: new Text(
                          'Sign In With Email',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            ),
                         
                          ),
                      ),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                       return MyApp4();
                     }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0, right:10, top: 10.0),
                    child: new Container(
                      alignment: Alignment.center,
                      height: 70.0,
                      decoration: new BoxDecoration(
                        color: Colors.blue,
                        borderRadius: new BorderRadius.circular(10.2),
                        ),
                        child: new Text(
                          'Social Media',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            ),
                          ),
                      ),
                  ),
                  ),
                ),
                Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                       return FirstScreen();
                     }));
                  },
                  
                    child: Padding(
                      padding: const EdgeInsets.only(left:10.0, right:20, top: 10.0),
                      child: new Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        decoration: new BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: new BorderRadius.circular(10.2),
                          ),
                          child: new Text(
                            'Google',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              ),
                            ),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
                  
        ),
      ),
    );
  }

}