import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              margin: EdgeInsets.symmetric( horizontal: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        border: Border.all(color: Colors.teal[900], width: 1),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(13),
                      child: Column(
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
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                       color: Colors.red[100],
                        border: Border.all(color: Colors.red[900], width: 1),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            countryData[index]['deaths'].toString(),
                            style: GoogleFonts.cabin(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 20),
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
              margin: EdgeInsets.symmetric( horizontal: 25),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                        border: Border.all(color: Colors.teal[900], width: 1),
                      ),
                      padding: const EdgeInsets.all(13),
                      child: Column(
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
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        border: Border.all(color: Colors.red[900], width: 1),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            countryData[index]['deaths'].toString(),
                            style: GoogleFonts.cabin(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 20),
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
