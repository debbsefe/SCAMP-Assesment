import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scamp_assesment/models/model.dart';
import 'package:http/http.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  

List <Summary> countryList = new List();
  void initState(){
    _getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: countryList.length, 
        itemBuilder: (context, index){
          return ListTile(title: Text(countryList[index].global.toString()),
          subtitle: Text(countryList[index].countries.toString()),
          );
      }
      ),
    );
  }

  Future<List<Summary>>_getApi() async {

    try{
      String url = "https://api.covid19api.com/summary";

    Response response = await get(url);
    final responseBody = response.body;
    var responseList = json.decode(responseBody) as List;
    List<Summary>listvalues = responseList.map((e) => Summary.fromJson(e)).toList();

    setState(() {
      countryList.addAll(listvalues);
    });
      return listvalues;

      
      }catch (e){
        print(e.toString());
        return null;
      }

    }
    
}
