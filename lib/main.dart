import 'package:flutter/material.dart';
import 'home_page.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
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

