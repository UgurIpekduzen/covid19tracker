import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'search.dart';

class Countrywide extends StatefulWidget {
  @override
  _CountrywideState createState() => _CountrywideState();
}

class _CountrywideState extends State<Countrywide> {
  //fetchcountrywideData: Ülkelere istatistiklerin tümünü getirir.
  List countrywideData;
  fetchcountrywideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countrywideData = json.decode(response.body);
    });
  }
  
  @override
  void initState() {
    fetchcountrywideData();
    super.initState();
  }
  //refreshCountryStats: Sayfa elle yenilendiği zaman gecikme süresini 2 saniye olarak ayarlar.
  Future <Null> refreshCountryStats() async {
    await Future.delayed(Duration(seconds: 2));
    initState();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfa başlığı
      appBar: AppBar(
        //Arama motoru buttonu
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            color: Colors.white,
            onPressed: (){
              showSearch(context: context, delegate: Search(countrywideData));
            },
          )
        ], 
        //Arama motoru buttonu sonu
        title: Text('Countrywide Statistics', style: GoogleFonts.cabin(fontSize: 25, color: Colors.white)),
        backgroundColor: Colors.teal
      ),
      // Sayfa başlığı sonu
      backgroundColor: Colors.grey[300],
      body: countrywideData == null ? Center( child: CircularProgressIndicator(),)
      : RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
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
                  children: [
                    // Ülkeye ait istatistiklerin gösterileceği panel
                    ExpansionTile(
                      title: 
                      // Panelin ülke adı ve bayrağının yazılı olduğu başlık
                        Container(  
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.all(1.5),
                                child: Row(
                                  children: [
                                    Image.network(
                                      countrywideData[index]['countryInfo']['flag'],
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
                                      countrywideData[index]['country'],
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
                                          border: Border.all(color: Colors.lightBlue[100], width: 1),
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['todayCases'])} ",
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['todayDeaths'])} ",
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['active'])} ",
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['cases'])} ",
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['deaths'])} ",
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
                                                  Text("${NumberFormat.compact().format(countrywideData[index]['recovered'])} ",
                                                    style: GoogleFonts.cabin(
                                                      color: Colors.green[900], 
                                                      fontSize: 30, 
                                                      fontWeight: FontWeight.bold
                                                    )
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
                )
              )
            );
          },
          // API'den istenen veriler çekilebildiyse tüm ülkeleri sırala, çekilemediyse hiçbir şey gösterme
          itemCount: countrywideData == null ? 0 : countrywideData.length,
        ),
        onRefresh: refreshCountryStats,
      ),
    );
  }
}
