import 'dart:developer';

import 'package:flutter/material.dart';

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
          return Container(
<<<<<<< HEAD
=======
            decoration: BoxDecoration(
              color: Color(0xFF292929),
              // border: Border.all(color: Color(0xFFfe9900), width: 5),
              border: Border(
                left: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 5,
                ),
                right: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 5,
                ),
                top: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 2.5,
                ),
                bottom: BorderSide(
                  color: Color(0xFFfe9900),
                  width: 2.5,
                ),
              )
            ),
>>>>>>> master
            margin: EdgeInsets.symmetric( horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      border: Border.all(color: Colors.grey[500], width: 3)
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
                      border: Border.all(color: Colors.red[500], width: 6)
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
        },
        itemCount: 5,
      ),
    );
  }
}
