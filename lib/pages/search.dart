import 'package:attraction_info/pages/items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';


class mainView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attraction Info'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: PlaceSearch());
            },
            ),
      ],
      backgroundColor: Color(0xFF1A237E),
      ),
      body: ListViewClickListener(),
     drawer: Drawer(child: drawer(context),),
    );
  }

  // Widget list(){
  //   return ListView(
  //         children: <Widget>[
  //           ListTile(
  //             leading: Icon(Icons.map),
  //             title: Text('Map'),
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.photo_album),
  //             title: Text('Album'),
  //           ),
  //           ListTile(
  //             leading: Icon(Icons.phone),
  //             title: Text('Phone'),
  //           ),
  //         ],
  //       );
  //}

  Widget drawer(context ){
    return ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('DevCa Attraction info', 
                    style: TextStyle(
                    color: Colors.white,
                    //fontWeight: FontWeight.bold,
                    fontSize: 24.0)
              ),
              decoration: BoxDecoration(
                color:Color(0xFF1A237E),
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Exit'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        );
  }

}

class ListViewClickListener extends StatefulWidget {
  _ListViewClickListenerState createState() => _ListViewClickListenerState();
}

class _ListViewClickListenerState extends State<ListViewClickListener> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _listViewData = [
    "Inducesmile.com",
    "Flutter Dev",
    "Android Dev",
    "iOS Dev!",
    "React Native Dev!",
    "React Dev!",
    "express Dev!",
    "Laravel Dev!",
    "Angular Dev!",
  ];

  
  List<List<String>> _data = new List<List<String>>();

  Future<String> getData() async {
    
    http.Response response = await http.get(
      
      Uri.encodeFull("http://api.opencaribbean.org/api/v1/location/locations"),
      headers: {
        "Accept": "application/json"
      }
      
      );
 
  
  List data = jsonDecode(response.body);
  List<List<String>> temp = new List<List<String>>();


  for(int a= 0; a < (data.length*0.02); a++){
    List<String> _subtemp = new List<String>();
    var tmp = data[a]["name"];
    var id = data[a]["id"];
    var adrs = data[a]["street"];
    var region = data[a]["region"];
    var country = data[a]["country"]["name"];
    var phonenum = data[a]["phoneNumbers"];
    var ilink = "http://api.opencaribbean.org/api/v1/resource/entities/"+data[a]["resourceId"];
    http.Response imagedata = await http.get(
      
      Uri.encodeFull(ilink),
      headers: {
        "Accept": "application/json"
      }
      
      );
      var img = "https://api.opencaribbean.org/api/v1/media/download/";
      try{
      if(jsonDecode(imagedata.body).length >5){
        List idata = [jsonDecode(imagedata.body)];
        img = img+idata[0]["mainImage"];
       // print(img);
      }else{
        img = img+"33268826-479c-4c70-bd0b-ddc3aa92b1fe.jpg";
      }
      }catch(e){
        print(e);
      }
      //var img = "https://api.opencaribbean.org/api/v1/media/download/"+idata["mainImage"];
      _subtemp.add(tmp);
      _subtemp.add(id);
      _subtemp.add(adrs);
      _subtemp.add(img);
      _subtemp.add(region);
      _subtemp.add(country);
      if(phonenum.length > 0){
        _subtemp.add(""+phonenum[0]);
      }else{_subtemp.add("#No PHONE NUMBER AVAILBALE");}
      
    temp.add(_subtemp);
   // print(tmp);
  }
    
  setState(() {
      _data = temp;
  });
  // setState(() {
  //     _text = data[0]["street"];
  //     print(data.length);
  //   });

  }
   @override
    void initState() {
      getData();
      //print(_demoData.length);

        // This is the proper place to make the async calls
        // This way they only get called once

        // During development, if you change this code,
        // you will need to do a full restart instead of just a hot reload
        
        // // You can't use async/await here,
        // // We can't mark this method as async because of the @override
        // loadAsyncData().then((result) {
        //     // If we need to rebuild the widget with the resulting data,
        //     // make sure to use `setState`
        //     setState(() {
        //         _result = result;
        //     });
        // });
    }

  @override
  Widget build(BuildContext context) {
    // getData();
     print(_data.length);
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: _data.map((data) => Card( 
                  child: ListTile(
                      leading: Image.network(
                        data[3],
                        width: 100,
                        //height: 300,
                        fit: BoxFit.cover
                        ),
                      title: Text(data[0]),
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>
                        MyApp4(data: data))
                        );
                      },
                      // onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                      //       content: Text("$data Clicked!"),
                      //       duration: Duration(seconds: 1),
                      //     )
                      // ),
                      subtitle: Text(data[2]),
                    )
                  )
                )
            .toList(),
      ),
    );
  }
}

class PlaceSearch extends SearchDelegate<String>{
final cities  = [
  "aghdad",
  "Iraq",
  "Bahia Blanca", 
  "Argentina",
  "Baku",   
  "Azerbaijan",
  "Bandung", 
  "Indonesia",
  "Bangalore",
  "India",
  "Jamaica"
];

final recentCities = [
   "Jamaica",
];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    // actions for the app bar 
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){

        }, 
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // leading icon on the lef t of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){

      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //show some result base on the selction 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //show when someone searches for something
     final suggestionList = query.isEmpty?recentCities:cities;
     return ListView.builder(
       itemBuilder: (context, index)=>ListTile(
         leading: Icon(Icons.location_city),
         title: Text(suggestionList[index]),
         ),
         itemCount: suggestionList.length,
       );
  }

}
