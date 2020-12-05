import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

double edgeCurve = 15;

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if(index == 4) {
            return Container(
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
                          Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 30,
                          ),
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
                          Text(
                            countryData[index]['country'].toString(),
                            style: GoogleFonts.cabin(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
                          Text(
                            NumberFormat.compact().format(countryData[index]['deaths']).toString(),
                            style: GoogleFonts.cabin(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black54, width: 1),
                )
              ),
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
                          Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 30,
                          ),
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
                          Text(
                            countryData[index]['country'].toString(),
                            style: GoogleFonts.cabin(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
                          Text(
                            NumberFormat.compact().format(countryData[index]['deaths']).toString(),
                            style: GoogleFonts.cabin(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            );
          }
        },
        itemCount: 5,
      ),
    );
  }
}
