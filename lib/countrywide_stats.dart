import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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

  Future <Null> refreshCountryStats() async {
    await Future.delayed(Duration(seconds: 2));
    initState();
    return null;
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
        title: Text('Countrywide Statistics', style: GoogleFonts.cabin(fontSize: 25)),
        backgroundColor: Colors.teal
      ),
      backgroundColor: Colors.grey[200],
      body: countryData == null
          ?
            Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Country Statistics
                        ExpansionTile(
                          title: 
                          // Country Info
                            Container(  
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(1.5),
                                    child: Row(
                                      children: [
                                        Image.network(
                                          countryData[index]['countryInfo']['flag'],
                                          height: 20,
                                          width: 30,
                                        ),
                                      ]
                                    )
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 7),
                                    child: Row(children: [
                                        Text(
                                          countryData[index]['country'],
                                          style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                                        ),
                                      ]
                                    )
                                  ),
                                ],
                              ),
                            ),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              margin: const EdgeInsets.symmetric(horizontal: 1.5),
                              child:Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              border: Border.all(color: Colors.lightBlue, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("DAILY CASES",style: GoogleFonts.cabin(color: Colors.lightBlue[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['todayCases'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              border: Border.all(color: Colors.deepOrange, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("DAILY DEATHS",style: GoogleFonts.cabin(color: Colors.deepOrange[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['todayDeaths'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              border: Border.all(color: Colors.orange, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("ACTIVE",style: GoogleFonts.cabin(color: Colors.orange[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['active'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: Border.all(color: Colors.blue, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("TOTAL CASES",style: GoogleFonts.cabin(color: Colors.blue[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['cases'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(color: Colors.red, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("DEATHS",style: GoogleFonts.cabin(color: Colors.red[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['deaths'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              border: Border.all(color: Colors.green, width: 1),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("RECOVERED",style: GoogleFonts.cabin(color: Colors.green[100], fontSize: 15, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text("${NumberFormat.compact().format(countryData[index]['recovered'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                              )
                            )
                          ],
                        ),
                      ]
                    )
                  )
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
            onRefresh: refreshCountryStats,
          ),
    );
  }
}
