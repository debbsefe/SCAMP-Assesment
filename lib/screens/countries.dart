import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scamp_assesment/models/model.dart';
import 'package:http/http.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  

//List <Countries> countryList = new List();

Future<Countries> countries;
  void initState(){
    _getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<Countries>(
            future: countries,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
             return ListView.builder(
                    itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data.countrie[index].totalConfirmed.toString(),),
                      subtitle: Text(snapshot.data.countrie[index].totalDeaths.toString(),
                    ),
                );
                });
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

 Future<List<Countries>> _getApi() async {
    final endpoint = "https://api.covid19api.com/summary";
    final response = await get(endpoint);
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse
        .map((countryStats) => Countries.fromJson(countryStats))
        .toList();
  }
    
}
