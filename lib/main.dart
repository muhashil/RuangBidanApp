import 'package:flutter/material.dart';
import 'package:belajar_flutter/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Ruang Bidan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Nav(),
    );
  }
}
