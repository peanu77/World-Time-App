import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/select_location.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //Set initialRoute to be the Loading module
      initialRoute: '/',
      // Assigning Routes
      routes: {
// import 'package:world_time_app/pages/loading.dart';
        //  Use to import loading module
        '/': (context) => Loading(),
// import 'package:world_time_app/pages/home.dart';
        //  Use to import loading module
        '/home': (context) => Home(),
// import 'package:world_time_app/pages/select_location.dart';
        //  Use to import select_location module
        '/location': (context) => SelectLocation(),
      },
    ));
