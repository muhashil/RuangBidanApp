import 'package:flutter/material.dart';
import 'dart:math';

class ImtResultView extends StatelessWidget {
  final int beratBadanBefore;
  final int tinggiBadan;

  ImtResultView({
    Key key,
    @required this.beratBadanBefore,
    @required this.tinggiBadan,
  }) : super(key: key);

  Widget _buildImtResult() {
    double tinggiBadanMeter = tinggiBadan * pow(10, -2);
    double imtResult = beratBadanBefore / pow(tinggiBadanMeter, 2);

    return TextFormField(
      controller: TextEditingController(text: imtResult.toString()),
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Indeks Massa Tubuh (IMT)',
        labelStyle: TextStyle(fontSize: 16.0),
        // hintText: 'Tulis angka disini',
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Bidan'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: _buildImtResult(),
        ),
      ),
    );
  }
}
