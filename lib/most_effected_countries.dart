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
            margin: EdgeInsets.symmetric( horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 30,
                ),
                Text(
                  countryData[index]['deaths'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
