import 'package:flutter/material.dart';
import 'package:ruang_bidan/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Map<int, Color> color = {
    50:Color.fromRGBO(217,0,116, .1),
    100:Color.fromRGBO(217,0,116, .2),
    200:Color.fromRGBO(217,0,116, .3),
    300:Color.fromRGBO(217,0,116, .4),
    400:Color.fromRGBO(217,0,116, .5),
    500:Color.fromRGBO(217,0,116, .6),
    600:Color.fromRGBO(217,0,116, .7),
    700:Color.fromRGBO(217,0,116, .8),
    800:Color.fromRGBO(217,0,116, .9),
    900:Color.fromRGBO(217,0,116, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Ruang Bidan',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFD90074, color),
      ),
      home: Nav(),
    );
  }
}
