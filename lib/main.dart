import 'package:flutter/material.dart';
import 'screens/countries.dart';
import 'screens/worldwide.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Covid Dashboard', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Colors.black,
      ),
      body: tabs(),
    );
  }
}

DefaultTabController tabs(){
  return DefaultTabController(
    length: 2,
    child: new Scaffold(
      body: TabBarView(
        children: <Widget>[
          Container(
            child: Worldwide(),
          ),
          Container(
            child: Country()
          ),
        ],
      ),
      drawerScrimColor: Colors.black,
      appBar: new TabBar(
        tabs: [
          Tab(
              child: Text('Worldwide', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20
              ),)
          ),
          Tab(
              child: Text('Countries', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20
              ),)
          ),
        ],
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
      ),
      backgroundColor: Colors.black,
    ),
  );
}