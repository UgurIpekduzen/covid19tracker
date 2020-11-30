import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'worldwide_total.dart';
import 'countrywise_stats.dart';
import 'most_effected_countries.dart';
import 'package:google_fonts/google_fonts.dart';

double edgeCurve = 10;

class HomePage extends StatefulWidget {

  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://corona.lmao.ninja/v3/covid-19/all";
  navigateToWorld() async
  {
    await Navigator.push(context, 
    MaterialPageRoute(
      builder: (context) => World()
      ));
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

   @override
  void initState() {
    fetchCountryData();
    this.getJsonData();
    super.initState();
  }

  Future <WorldwideTotal> getJsonData() async
  {
    var response = await http.get(
      Uri.encodeFull(url), 
    );
       
    if (response.statusCode==200)
    {
      final convertDataJson = jsonDecode(response.body);
    
    return WorldwideTotal.fromJson(convertDataJson);
    }
    else{
      throw Exception('Try to  Reload Page');
    }
  }

  Future <Null> refreshHomePage() async {
    await Future.delayed(Duration(seconds: 2));
    initState();
    return null;
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('#StayAtHome', style: GoogleFonts.cabin(color:Colors.white,fontSize :30, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[600],
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        child:  Container(
        child : Center(
        child :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Worldwide Statistics',style: GoogleFonts.cabin(color:Colors.black54,fontSize :25, fontWeight: FontWeight.bold))
              ],
            )
          ),

          FutureBuilder<WorldwideTotal>(

          future: getJsonData(),
          builder: (BuildContext context, SnapShot){
            if(SnapShot.hasData)
            {
              final covid = SnapShot.data;
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                  children : <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric( horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  border: Border.all(color: Colors.blue[900], width: 1),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(edgeCurve))
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("Total Cases ",style: GoogleFonts.cabin(color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  border: Border.all(color: Colors.blue[900], width: 1),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(edgeCurve))
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("${covid.cases} ",style: GoogleFonts.cabin(color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric( horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  border: Border.all(color: Colors.red[900], width: 1)
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("Deaths",style: GoogleFonts.cabin(color: Colors.red[900], fontSize: 20, fontWeight: FontWeight.bold),),
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
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("${covid.deaths} ",style: GoogleFonts.cabin(color: Colors.red[900], fontSize: 20, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric( horizontal: 20),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[300],
                                  border: Border.all(color: Colors.green[900], width: 1),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(edgeCurve))
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("Recovered",style: GoogleFonts.cabin(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
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
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(edgeCurve))
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("${covid.recovered} ",style: GoogleFonts.cabin(color: Colors.green[900], fontSize: 20, fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                  )
                ) 
              );
            }
            else if(SnapShot.hasError){
              return Text(SnapShot.error.toString());
            }

            return CircularProgressIndicator();
          }
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Most Affected Countries',style: GoogleFonts.cabin(color:Colors.black54,fontSize :25, fontWeight: FontWeight.bold))
            ],
          )
        ),
        Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child : Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children : <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[200],
                        border: Border.all(color: Colors.teal[900], width: 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Countries",style: GoogleFonts.cabin(color: Colors.teal[900], fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[200],
                        border: Border.all(color: Colors.red[900], width: 1),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Deaths",style: GoogleFonts.cabin(color: Colors.red[900], fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ),
                  ),
              ]
            ) 
        ),
        countryData == null
            ? Container()
            : MostAffectedPanel(
                countryData: countryData,
              ),
        Container(
          padding: const EdgeInsets.all(10),
            child:Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Card(
                  child :Container(color: Colors.teal[600],
                    child : Center(
                    child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children : <Widget>[
                      OutlineButton(
                        padding: const EdgeInsets.all(15),
                        borderSide: BorderSide(color : Colors.teal[600], width: 2),
                        onPressed: ()=> navigateToWorld(),
                        child : Text("Countrywise Statistics",style: GoogleFonts.cabin(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ]))
                  ) 
                ),
              ]
            )
          ),
        ],   
      )
        ),
      ), onRefresh: refreshHomePage
    )
    );    
  }
}