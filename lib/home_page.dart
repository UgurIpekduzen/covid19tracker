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
        title: Text('COVID-19 Tracker'),
        backgroundColor: Color(0xFFfe9900),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:  Container(
       child : Center(
      child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,

       children: <Widget>[
            
          Padding(padding: EdgeInsets.only(top : 10)),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:<Widget>[
            Text('Worldwide statistics',style: TextStyle(color:Colors.white,fontSize :22, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top:10)),
          ]
         ),
        FutureBuilder<Tcases>(

        future: getJsonData(),
        builder: (BuildContext context,SnapShot){
          if(SnapShot.hasData)
          {
            final covid = SnapShot.data;
            return Column( 
              children : <Widget>[
                Card(color: Color(0xFF292929),
                  child : ListTile(

                    
                    title: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children : <Widget>[
                      
                      
                    Text("Total Cases ",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Recoveries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),

                    ]) )
                ),
                Card(color: Color(0xFF292929),
              child : ListTile(

                
                title: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children : <Widget>[
                  
                  
                Text("${covid.cases} ",style: TextStyle(color: Colors.blue, fontSize: 23, fontWeight: FontWeight.bold),),
                Text("${covid.deaths}",style: TextStyle(color: Colors.red, fontSize: 23, fontWeight: FontWeight.bold),),
                Text("${covid.recovered}",style: TextStyle(color: Colors.green, fontSize: 23, fontWeight: FontWeight.bold)),

                ]) )
              ),
            
            
            ]);
          }
          else if(SnapShot.hasError){
            return Text(SnapShot.error.toString());
          }

          return CircularProgressIndicator();
        }
       ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'Most affected Countries',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Container(
<<<<<<< HEAD
           
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
                    padding: const EdgeInsets.all(16),
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ),
                ),
=======
            decoration: BoxDecoration(
              color: Color(0xFF292929),
              // border: Border.all(color: Color(0xFFfe9900), width: 5),
              border: Border(
                left: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 5,
                ),
                right: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 5,
                ),
                top: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 2.5,
                ),
                bottom: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 2.5,
                ),
              )
            ),
            margin: EdgeInsets.symmetric( horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child : ListTile(
              title: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget>[
                Text("Countries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
>>>>>>> master
            ]
          ) 
      ),
      // Card(color: Color(0xFF292929),
      //   child : ListTile(
      //     title: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children : <Widget>[
      //         Text("Countries",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      //         Text("Deaths",style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      //       ]
      //     ) 
      //   )
      // ),
      countryData == null
          ? Container()
          : MostAffectedPanel(
              countryData: countryData,
            ),
       Container(
          child:Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              Card(
                child :Container(color: Color(0xFF292929),
                  child : Center(
                  child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : <Widget>[

                    OutlineButton(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      borderSide: BorderSide(color : Color(0xFFfe9900)),
                      onPressed: ()=> navigateToWorld(),
                      child : Text("Countrywise Statistics",style: TextStyle(fontSize: 15,color:Color(0xFFfe9900),fontWeight: FontWeight.bold),),
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