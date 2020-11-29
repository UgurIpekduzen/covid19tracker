import 'dart:developer';
import 'package:flutter/material.dart';

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
              margin: EdgeInsets.symmetric( horizontal: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[300],
                        border: Border.all(color: Colors.teal[300], width: 3),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(16),
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
                        color: Colors.red[500],
                        border: Border.all(color: Colors.red[500], width: 6),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(edgeCurve))
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            countryData[index]['deaths'].toString(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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
              margin: EdgeInsets.symmetric( horizontal: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[300],
                        border: Border.all(color: Colors.teal[300], width: 3),
                      ),
                      padding: const EdgeInsets.all(16),
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
                        color: Colors.red[500],
                        border: Border.all(color: Colors.red[500], width: 6),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            countryData[index]['deaths'].toString(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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
