import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // Return the instance of
  void setWorldTime() async{
    // Pass the data of WorldTime to the instance variable
    WorldTime instance = WorldTime(location: 'Manila', url: 'Asia/Manila');
    // use to make a request to the world_time module getTime to pass the url
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    //Function call to the setWorldTime
    setWorldTime();

  }
  // Loading Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],

      body: Center(

        child: SpinKitPulse(
          color: Colors.grey[800],
          size: 100.0,
        ),
      ),
    );
  }
}