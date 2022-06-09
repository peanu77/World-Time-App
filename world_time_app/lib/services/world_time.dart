import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  // Store Location name to us in UI
  String location;
  // Store Time of Location
  String time;
  // Fetch the Specific url and pass to the getTime Funtion/Method.
  String url;
  // Check if dayTime otherwise not
  bool isDayTime;

  WorldTime({this.location, this.url});

  // Uses async and (Future) promise type in JavaScript
  Future<void> getTime()async{

    try{
      // Request api
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Assigning datetime and utc_offset to be use later on
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //  create DateTime Object
      DateTime now = DateTime.parse(datetime);
      //combine and parse the utc_offset together with the datime
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // Used the time variable in WorldTIme Class
      isDayTime = now.hour > 1 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      time = "Error, Please Contact the Developer $e";
    }
  }
}