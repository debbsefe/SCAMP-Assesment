import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scamp_assesment/models/model.dart';
import 'package:http/http.dart';

class Worldwide extends StatefulWidget {
  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {

  Future<Global> global;

  @override
  void initState(){
    super.initState();
    global = _getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: FutureBuilder<Global>(
          future: global,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return ListView(
            children: <Widget>[
              //new Text('Global Covid19 statistics'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(227, 105, 36, 0.9), width: 2.0),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: new Container(
                    color: Color.fromRGBO(227, 105, 36, 0.9),
                    height: 150,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Total Cases', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        new Text(snapshot.data.totalConfirmed.toString(), style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),),    
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(150,17,120, 0.9),  width: 2.0),
                    borderRadius: BorderRadius.circular(4.0)),
                  child: new Container(
                    color: Color.fromRGBO(150,17,120, 0.9),
                    height: 150,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Total Deaths', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        new Text(snapshot.data.totalDeaths.toString(), style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                   shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(183,22,10, 0.9),  width: 2.0),
                    borderRadius: BorderRadius.circular(4.0)),
                  child: new Container(
                    color: Color.fromRGBO(183,22,10, 0.9), 
                    height: 150,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Total Recovered', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
                        new Text(snapshot.data.totalRecovered.toString(), style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
            }else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  Future<Global>_getApi() async {

  
      String url = "https://api.covid19api.com/world/total";

    final response = await get(url);
    if(response.statusCode == 200){
      return Global.fromJson(json.decode(response.body));

    }else{
      throw Exception('Failed to load global');

    }

  }
}

