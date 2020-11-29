import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'total_cases.dart';
import 'worldwise_cases.dart';
import 'most_effected_countries.dart';

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

  Future <Tcases> getJsonData() async
  {
    var response = await http.get(
      Uri.encodeFull(url), 
    );
       
    if (response.statusCode==200)
    {
      final convertDataJson = jsonDecode(response.body);
    
    return Tcases.fromJson(convertDataJson);
    }
    else{
      throw Exception('Try to  Reload Page');
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('#StayHome', style: TextStyle(color:Colors.white,fontSize :25, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:  Container(
       child : Center(
      child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
            
        // Padding(padding: EdgeInsets.only(top : 10)),

        // Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //    children:<Widget>[
        //     Text('Worldwide Statistics',style: TextStyle(color:Colors.white,fontSize :22, fontWeight: FontWeight.bold)),
        //     Padding(padding: EdgeInsets.only(top:10)),
        //   ]
        // ),
        Container(
          margin: EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Worldwide Statistics',style: TextStyle(color:Colors.white,fontSize :25, fontWeight: FontWeight.bold))
            ],
          )
        ),

        FutureBuilder<Tcases>(

        future: getJsonData(),
        builder: (BuildContext context,SnapShot){
          if(SnapShot.hasData)
          {
            final covid = SnapShot.data;
            return Column(
              children : <Widget>[
                Container(
                  margin: EdgeInsets.symmetric( horizontal: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue, width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Total Cases ",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            border: Border.all(color: Colors.blue[300], width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("${covid.cases} ",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
                            color: Colors.red[900],
                            border: Border.all(color: Colors.red[900], width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red[500],
                            border: Border.all(color: Colors.red[500], width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("${covid.deaths} ",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
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
                            color: Colors.green,
                            border: Border.all(color: Colors.green, width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("Recovered",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[300],
                            border: Border.all(color:Colors.green[300], width: 3)
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("${covid.recovered} ",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ]
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
            Text('Most Affected Countries',style: TextStyle(color:Colors.white,fontSize :25, fontWeight: FontWeight.bold))
          ],
        )
      ),
      Container(
            margin: EdgeInsets.symmetric( horizontal: 20),
            // padding: const EdgeInsets.symmetric(vertical: 5),
            child : Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      border: Border.all(color: Colors.grey[800], width: 3)
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Countries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      border: Border.all(color: Colors.red[900], width: 3)
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
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
                child :Container(color: Colors.teal[400],
                  child : Center(
                  child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : <Widget>[
                    OutlineButton(
                      padding: const EdgeInsets.all(15),
                      borderSide: BorderSide(color : Colors.teal[400], width: 2),
                      onPressed: ()=> navigateToWorld(),
                      child : Text("Countrywise Statistics",style: TextStyle(fontSize: 20,color:Colors.white,fontWeight: FontWeight.bold),),
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
    )
    ) 
    );    
  }
}