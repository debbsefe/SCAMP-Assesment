import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scamp_assesment/models/model.dart';
import 'package:http/http.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  

Future<List <Countries>> countryList ;
//= new List();

//Future<Countries>countries;
  void initState(){
    _getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Countries>>(
            future: countryList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
             return ListView.builder(
                    itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data.toList().toString()),
                      //subtitle: Text(snapshot.data.[index],
                    
                );
                }
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      );
    
  }

Future <List<Countries>> _getApi() async {

  
      String url = "https://api.covid19api.com/summary";

    final response = await get(url);
    if(response.statusCode == 200){

      List<dynamic> values = new List<dynamic>();
      values = json.decode(response.body);
      if(values.length>0){
        var lst = response.body as List;
        return lst.map((d) => Countries.fromJson(d)).toList();
      }
      //return countryList;

    }else{
      throw Exception('Failed to load country');

    }

  }
    
}
