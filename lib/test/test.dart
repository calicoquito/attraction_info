import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';





class TestMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test view'),
      ),
      body: ListViewClickListener(),
    );
  }

}
class ListViewClickListener extends StatefulWidget {
  _ListViewClickListenerState createState() => _ListViewClickListenerState();
}

class _ListViewClickListenerState extends State<ListViewClickListener> {
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

  var _text = 'string work';

  Future<String> getData() async {
    
    http.Response response = await http.get(
      
      Uri.encodeFull("http://api.opencaribbean.org/api/v1/location/locations"),
      headers: {
        "Accept": "application/json"
      }
      
      );
 
  
  List data = jsonDecode(response.body);
  setState(() {
      _text = data[0]["street"];
      print(data.length);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text),
            RaisedButton(
              onPressed: () {
                getData();
              },
              child: const Text(
                  'Enabled Button',
                   style: TextStyle(fontSize: 20)
                ),
            ),
          ],
        ),
      ),
    );
  }
}

