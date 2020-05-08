import 'package:flutter/material.dart';

class Worldwide extends StatefulWidget {
  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              new Card(
                child: new Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  height: 220,
                width: double.maxFinite,
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              Card(
                child: new Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  height: 220,
                width: double.maxFinite,
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
              Card(
                child: new Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  height: 220,
                width: double.maxFinite,
                  child: new Column(
                    children: <Widget>[
                      new Text('Hello World'),
                      new Text('How are you?')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

