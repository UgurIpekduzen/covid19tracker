import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:intl/intl.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white
          ),
        padding: EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            //Most Affected Countries başlığı 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Most Affected Countries',
                    style: GoogleFonts.cabin(
                      color:Colors.black,
                      fontSize :25, 
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
            ),
            //Most Affected Countries başlığı sonu
            //Most Affected Countries sütun başlıkları
            Container(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("FLAG",
                            style: GoogleFonts.cabin(
                              color: Colors.black54, 
                              fontWeight: FontWeight.bold, 
                              fontSize: 15
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("COUNTRY",
                            style: GoogleFonts.cabin(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold, 
                              fontSize: 15
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("DEATHS",
                            style: GoogleFonts.cabin(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold, 
                              fontSize: 15
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
            //Most Affected Countries sütun başlıkları sonu
            //API'dan veri çekilememişse boş bir yapı bastırır, veri çekilebilmesi durumunda verileri listeler.
            countryData == null ? Container()
            : Container(
              padding: const EdgeInsets.symmetric(horizontal:2),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black54, width: 1),
                      )
                    ),
                    padding: const EdgeInsets.symmetric(vertical:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Ülke bayrağı sütunu
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 30,
                                ),
                              ],
                            )
                          ),
                        ), 
                        // Ülke bayrağı sütunu sonu
                        // Ülke adı sütunu
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  countryData[index]['country'].toString(),
                                  style: GoogleFonts.cabin(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            )
                          ),
                        ),
                        // Ülke adı sütunu sonu
                        // Ülkeye ait toplam ölüm sayıları sütunu
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  NumberFormat.compact().format(countryData[index]['deaths']).toString(),
                                  style: GoogleFonts.cabin(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            )
                          ),
                        ), 
                        // Ülkeye ait toplam ölüm sayıları sütunu sonu
                      ],
                    ),
                  );
                },
                //İlk 5 ülkenin sıralamasını yapar.
                itemCount: 5,
              ),
            )
          ]
        )
      )
    );
  }
}
