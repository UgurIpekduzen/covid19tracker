//Worldwide Statistics panelinde gösterilecek verilerin tutulacağı class
class WorldwideTotal
{
  var cases;
  var deaths;
  var recovered;
  var updated;

  WorldwideTotal({this.cases,this.deaths,this.recovered,this.updated});

  factory WorldwideTotal.fromJson(final json)
  {
    return WorldwideTotal(
        
      cases: json["cases"],
      deaths : json["deaths"],
      recovered : json["recovered"],
      updated : json["updated"],
    );
  }
}