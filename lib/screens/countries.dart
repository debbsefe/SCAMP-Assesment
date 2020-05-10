import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scamp_assesment/models/model.dart';
import 'package:http/http.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  

// List <Countries> countryList = new List();
//   void initState(){
//     _getApi();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: countryList.length, 
        itemBuilder: (context, index){
          return ListTile(title: Text(countryList[index].totalConfirmed.toString()),
          subtitle: Text(countryList[index].newDeaths.toString()),
          );
      }
      ),
    );
  }

 Future<List<Countries>> _getApi() async {
    final endpoint = "https://api.covid19api.com/summary";
    final response = await get(endpoint);
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse
        .map((countryStats) => Countries.fromJson(countryStats))
        .toList();
  }
    
}
