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
                              style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black/*Colors.teal[900]*/, fontSize: 16),
                            ),
                          ]
                        )
                      ),
                    ],
                  ),
                ),
                // Country Statistics
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  child:Column(
                    children: <Widget>[
                      //Today / Daily Statistics
                      Container(
                        margin: const EdgeInsets.all(1.5),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text('Daily', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20))
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  //Daily Cases
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Cases:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              border: Border.all(color: Colors.lightBlue),
                                              borderRadius: BorderRadius.all(Radius.circular(100))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('${suggestionList[index]['todayCases'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                              ],
                                            ),
                                          )
                                      ],),
                                    ),
                                  ),
                                  //Daily Deaths
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(0),
                                      margin: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Deaths:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              border: Border.all(color: Colors.deepOrange),
                                              borderRadius: BorderRadius.all(Radius.circular(100))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('${suggestionList[index]['todayDeaths'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                              ],
                                            ),
                                          )
                                      ],),
                                    ),
                                  ),
                                ],
                              )
                            )
                          ]
                        )
                      ),
                      //Total Statistics
                      Container(
                        margin: const EdgeInsets.all(1.5),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text('Total', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20))
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        //Total Cases
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Cases:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    border: Border.all(color: Colors.blue),
                                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('${suggestionList[index]['cases'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                                    ],
                                                  ),
                                                ),
                                            ],),
                                          ),
                                        ),
                                        //Total Deaths
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Deaths:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(color: Colors.red),
                                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('${suggestionList[index]['deaths'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                                    ],
                                                  ),
                                                )
                                            ],),
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        //Active
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Active:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    border: Border.all(color: Colors.orange),
                                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('${suggestionList[index]['active'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                                    ],
                                                  ),
                                                )
                                            ],),
                                          ),
                                        ),
                                        //Recovered
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(0),
                                            margin: const EdgeInsets.symmetric(horizontal: 15),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('Recovered:', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 16)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border.all(color: Colors.green),
                                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text('${suggestionList[index]['recovered'].toString()}', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30))
                                                    ],
                                                  ),
                                                )
                                            ],),
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ]
                        )
                      ),
                    ],
                  ),
                ),
              ]
            ),
          )
        );
      })
    );
  }

}