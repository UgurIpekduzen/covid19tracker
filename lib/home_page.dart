import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'worldwide_total.dart';
import 'countrywide_stats.dart';
import 'most_effected_countries.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigateToCountrywide: Countrywide Statistics buttonuna basıldğı zaman ilgili sayfaya yönlendirir.
  navigateToCountrywide() async
  {
    await Navigator.push(context, 
    MaterialPageRoute(
      builder: (context) => Countrywide()
      ));
  }
  //fetchCountryData: Ülkesel istatistiklerin vaka sayılarına göre sıralanmış listesini getirir.
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  /*
    initState: Oluşturulan tasarımla beraber API'e yapılan istek sonucu elde edilen verileri
    ve diğer methodların sonuçlarını yükler.
  */
  @override
  void initState() {
    fetchCountryData();
    this.getWorldwideData();
    super.initState();
  }
  //getWorldwideData: Dünya üzerinde açıklanan tüm COVID-19 verilerinin toplam sayılarını getirir
  Future <WorldwideTotal> getWorldwideData() async
  {
    var response = await http.get(
      Uri.encodeFull("https://corona.lmao.ninja/v3/covid-19/all"), 
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
  //refreshHomePage: Sayfa elle yenilendiği zaman gecikme süresini 2 saniye olarak ayarlar.
  Future <Null> refreshHomePage() async {
    await Future.delayed(Duration(seconds: 2));
    initState();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Sayfa başlığı
      appBar: AppBar(
        centerTitle: true,
        title: Text('#StayAtHome', style: GoogleFonts.cabin(color:Colors.white,fontSize :30, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),//Sayfa başlığı sonu
      backgroundColor: Colors.grey[300],
      //RefreshIndicator: uygulama sayfası parmak hareketiyle güncellenmesini sağlar.
      body: RefreshIndicator(
        child:  Container(
          child : Center(
            child :Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Worldwide Statistics paneli   
                FutureBuilder<WorldwideTotal>(
                  future: getWorldwideData(),
                  builder: (BuildContext context, SnapShot){
                    if(SnapShot.hasData)
                    {
                      final covid = SnapShot.data;
                      return Card(
                        elevation: 0,
                        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white
                          ),
                          margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Column(
                            children: [
                              // Worldwide Statistics paneli başlığı
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Worldwide Statistics',
                                      style: GoogleFonts.cabin(
                                        color:Colors.black, 
                                        fontSize :25, 
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  ],
                                ),
                              ),
                              // Worldwide Statistics paneli başlığı sonu
                              //Toplam rakamların gösterileceği kısım
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    //Toplam vaka sayısı kutucuğu
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2),
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
                                                  //NumberFormat.compact().format(): Çok haneli sayıları okunabilir formata çevirir.
                                                  Text("${NumberFormat.compact().format(covid.cases)} ",
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
                                    //Toplam vaka sayısı kutucuğu sonu
                                    //Ölümler sayısı kutucuğu 
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2),
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
                                                  Text("${NumberFormat.compact().format(covid.deaths)} ",
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
                                    //Ölümler sayısı kutucuğu sonu
                                    //İyileşenler sayısı kutucuğu
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2),
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
                                                  Text("${NumberFormat.compact().format(covid.recovered)} ",
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
                                    //İyileşenler sayısı kutucuğu sonu
                                  ],
                                ),
                              )
                              //Toplam rakamların gösterileceği kısım sonu
                            ],
                          ), 
                        )
                      );
                    }
                    else if(SnapShot.hasError){
                      return Text(SnapShot.error.toString());
                    }
                    return CircularProgressIndicator();
                  }
                ),
                //Worldwide Statistics paneli sonu
                //Most Affected Countries paneli
                MostAffectedPanel(countryData: countryData),              
                //Most Affected Countries paneli sonu
                //Countrywide Statistics sayfası buttonu
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child:Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ 
                      Card(
                        child :Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.teal,
                          ),
                          child : Center(
                            child: Column( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children : <Widget>[
                                OutlineButton(
                                  padding: const EdgeInsets.all(10),
                                  onPressed: ()=> navigateToCountrywide(),
                                  child : Text("Countrywide Statistics",
                                    style: GoogleFonts.cabin(
                                      fontSize: 20,
                                      color:Colors.white, 
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ]
                            )
                          )
                        ) 
                      ),
                    ]
                  )
                ),
                //Countrywide Statistics sayfası buttonu sonu
              ],
            )
          ),
        ), onRefresh: refreshHomePage
      )
    );
  }
}