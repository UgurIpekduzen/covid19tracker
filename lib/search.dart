import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);
  /*
    buildActions: SearchDelegate class'ının varsayılan methodu.
    Arama motoru simgesine basıldığı zaman boş bir search bar açılır.
    Clear buttonuna basıldığı zaman sorgu sıfırlanır.
  */
  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';
     })
   ];
  }
  /*
    buildLeading: SearchDelegate class'ının varsayılan methodu.
    Back buttonuna basıldığı zaman arama sonucunu iptal edip arama motorunu kapatır.
  */
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    });
  }
  /*
    buildResults: SearchDelegate class'ının varsayılan methodu.
    Sorgu sonunda elde edilen sonuçların gösterileceği boş bir alan oluşturur.
  */
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  /*
    buildSuggestions: SearchDelegate class'ının varsayılan methodu.
    Aratacağımız ülken isminin baş harfiyle başlayan diğer ülkelerden oluşan önerisi listesini gösterir.
  */
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? countryList
    : countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
            return Card(
              elevation: 0,
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    // Ülkeye ait istatistiklerin gösterileceği panel
                    ExpansionTile(
                    // Panelin ülke adı ve bayrağının yazılı olduğu başlık
                    title: Container(  
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
                    // Panelin ülke adı ve bayrağının yazılı olduğu başlık sonu
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 1.5),
                        child:Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  // Günlük vakalar sayısı kutucuğu 
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[100],
                                        border: Border.all(color:Colors.lightBlue[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("DAILY CASES",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.lightBlue[900], 
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['todayCases'])}",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.lightBlue[900], 
                                                    fontSize: 30, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Günlük vakalar sayısı kutucuğu sonu
                                  // Günlük ölümler sayısı kutucuğu 
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange[100],
                                        border: Border.all(color: Colors.deepOrange[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("DAILY DEATHS",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.deepOrange[900], 
                                                    fontSize: 15, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['todayDeaths'])}",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.deepOrange[900],
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Günlük ölümler sayısı kutucuğu sonu
                                  // Toplam aktif vaka sayısı kutucuğu 
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange[100],
                                        border: Border.all(color: Colors.orange[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("ACTIVE",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.orange[900], 
                                                    fontSize: 15, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['active'])} ",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.orange[900],
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Toplam aktif vaka sayısı kutucuğu sonu
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  // Toplam vakalar sayısı kutucuğu
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[100],
                                        border: Border.all(color: Colors.blue[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("TOTAL CASES",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.blue[900],
                                                    fontSize: 15, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['cases'])}",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.blue[900], 
                                                    fontSize: 30, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Toplam vakalar sayısı kutucuğu sonu
                                  // Toplam ölümler sayısı kutucuğu 
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.red[100],
                                        border: Border.all(color: Colors.red[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("DEATHS",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.red[900], 
                                                    fontSize: 15, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['deaths'])} ",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.red[900],
                                                    fontSize: 30, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Toplam ölümler sayısı kutucuğu sonu
                                  // Toplam iyileşenler sayısı kutucuğu 
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        border: Border.all(color: Colors.green[100], width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("RECOVERED",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.green[900], 
                                                    fontSize: 15, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text("${NumberFormat.compact().format(suggestionList[index]['recovered'])} ",
                                                  style: GoogleFonts.cabin(
                                                    color: Colors.green[900], 
                                                    fontSize: 30, 
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                  // Toplam iyileşenler sayısı kutucuğu sonu
                                ],
                              ),
                            ),
                          ]
                        )
                      )
                    ],
                  ),
                  // Ülkeye ait istatistiklerin gösterileceği panel sonu
                ]
              ),
            )
          );
        }
      )
    );
  }
}