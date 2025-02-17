import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'home_page.dart';
void main() => runApp(MyApp());
//Bütün sayfaları çağıracak ana class
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "COVID-19 Tracker",
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomePage()
    );
  }
}
