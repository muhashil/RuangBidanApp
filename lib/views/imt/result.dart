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
      controller: TextEditingController(text: imtResult.toStringAsFixed(2)),
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

  Widget _buildImtStatus() {
    double tinggiBadanMeter = tinggiBadan * pow(10, -2);
    double imtResult = beratBadanBefore / pow(tinggiBadanMeter, 2);

    String statusResult = '';
    if (imtResult < 19.8) {
      statusResult = 'Rendah';
    } else if (imtResult >= 19.8 && imtResult < 26.0) {
      statusResult = 'Normal';
    } else if (imtResult >= 26.0 && imtResult < 29.0) {
      statusResult = 'Tinggi';
    } else if (imtResult > 29.0) {
      statusResult = 'Obesitas';
    }

    return TextFormField(
      controller: TextEditingController(text: statusResult),
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Nilai IMT',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImtResult(),
              SizedBox(height: 24),
              _buildImtStatus()
            ],
          ),
        ),
      ),
    );
  }
}
