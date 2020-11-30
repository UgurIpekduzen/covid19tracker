import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'search.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  List countryData;

  fetchCountryData() async {
    
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Search(countryData));
          },)
        ],
        title: Text('Countrywise Statistics', style: GoogleFonts.cabin()),
        backgroundColor: Colors.teal[600]
      ),
      backgroundColor: Colors.white,
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.teal[100],
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: 130,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countryData[index]['country'],
                                style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.teal[900], fontSize: 16),
                              ),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 50,
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children : <Widget>[
                                Container(
                                  child: Row( 
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue[200],
                                            border: Border.all(color: Colors.lightBlue[900], width: 1),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Total Cases",style: GoogleFonts.cabin(color: Colors.lightBlue[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue[100],
                                            border: Border.all(color: Colors.lightBlue[900], width: 1),
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(5))
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['cases'].toString()} ",style: GoogleFonts.cabin(color: Colors.lightBlue[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue[200],
                                            border: Border.all(color: Colors.blue[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Today's Cases",style: GoogleFonts.cabin(color: Colors.blue[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            border: Border.all(color: Colors.blue[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['todayCases'].toString()} ",style: GoogleFonts.cabin(color: Colors.blue[900],fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red[200],
                                            border: Border.all(color: Colors.red[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Total Deaths",style: GoogleFonts.cabin(color: Colors.red[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red[100],
                                            border: Border.all(color: Colors.red[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['deaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.red[900],fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrange[200],
                                            border: Border.all(color: Colors.deepOrange[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Today's Deaths",style: GoogleFonts.cabin(color: Colors.deepOrange[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrange[100],
                                            border: Border.all(color: Colors.deepOrange[900], width: 1)
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['todayDeaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.deepOrange[900],fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row( 
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.amber[200],
                                            border: Border.all(color: Colors.amber[900], width: 1),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Active",style: GoogleFonts.cabin(color: Colors.amber[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.amber[100],
                                            border: Border.all(color: Colors.amber[900], width: 1),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['active'].toString()} ",style: GoogleFonts.cabin(color: Colors.amber[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green[200],
                                            border: Border.all(color: Colors.green[900], width: 1),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5))
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("Recovered",style: GoogleFonts.cabin(color: Colors.green[900], fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green[100],
                                            border: Border.all(color:Colors.green[900], width: 1),
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5))
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: Column(
                                            children: [
                                              Text("${countryData[index]['deaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.green[900],fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
