import 'package:flutter/material.dart';

class TbjResultView extends StatelessWidget {
  final double tfu;
  final Map selectedPap;

  TbjResultView({
    Key key,
    @required this.tfu,
    @required this.selectedPap,
  }) : super(key: key);

  Widget _buildTaksiranBeratJaninResult() {
    double result = 0;
    if (selectedPap['value'] == 'yes') {
      result = (tfu - 11) * 150;
    } else {
      result = (tfu - 10) * 150;
    }

    return TextFormField(
      controller: TextEditingController(text: result.toStringAsFixed(2)),
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Taksiran Berat Janin (gr)',
        labelStyle: TextStyle(fontSize: 16.0),
        // hintText: 'Tulis angka disini',
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      autofocus: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Bidan'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildTaksiranBeratJaninResult()],
          ),
        ),
      ),
    );
  }
}
