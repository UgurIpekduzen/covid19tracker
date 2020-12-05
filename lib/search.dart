import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
     backgroundColor: Colors.grey[200],
      body:ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context,index){
          return Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Country Info
                Container(  
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(1.5),
                        child: Row(
                          children: [
                            Image.network(
                              suggestionList[index]['countryInfo']['flag'],
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
                              suggestionList[index]['country'],
                              style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                            ),
                          ]
                        )
                      ),
                    ],
                  ),
                ),
                // Country Statistics
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['todayCases'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['todayDeaths'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['active'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['cases'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['deaths'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
                                          Text("${NumberFormat.compact().format(suggestionList[index]['recovered'])} ",style: GoogleFonts.cabin(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
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
              ]
            ),
          )
        );
      })
    );
  }

}