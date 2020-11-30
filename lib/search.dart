import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';
     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList = query.isEmpty ?
           countryList:
           countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
    
    return Scaffold(
     backgroundColor: Colors.white,
      body:ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context,index){
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
                        suggestionList[index]['country'],
                        style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.teal[900], fontSize: 16),
                      ),
                      Image.network(
                        suggestionList[index]['countryInfo']['flag'],
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
                                              Text("${suggestionList[index]['cases'].toString()} ",style: GoogleFonts.cabin(color: Colors.lightBlue[900], fontWeight: FontWeight.bold),),
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
                                              Text("${suggestionList[index]['todayCases'].toString()} ",style: GoogleFonts.cabin(color: Colors.blue[900],fontWeight: FontWeight.bold),),
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
                                              Text("${suggestionList[index]['deaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.red[900],fontWeight: FontWeight.bold),),
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
                                              Text("${suggestionList[index]['todayDeaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.deepOrange[900],fontWeight: FontWeight.bold),),
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
                                              Text("${suggestionList[index]['active'].toString()} ",style: GoogleFonts.cabin(color: Colors.amber[900], fontWeight: FontWeight.bold),),
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
                                              Text("${suggestionList[index]['deaths'].toString()} ",style: GoogleFonts.cabin(color: Colors.green[900],fontWeight: FontWeight.bold),),
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
      })
    );
  }

}