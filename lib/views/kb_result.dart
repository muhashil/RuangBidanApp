import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class KbResultView extends StatelessWidget {
  final DateTime selectedDate;
  final _formatter = intl.DateFormat('dd MMMM yyyy');

  KbResultView({
    Key key,
    @required this.selectedDate,
  }) : super(key: key);

  Widget _buildKbResult() {
    DateTime nextSuntikKb = selectedDate.add(const Duration(days: 30));

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Suntik KB Selanjutnya',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: _formatter.format(nextSuntikKb),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        suffixIcon: Icon(
          CupertinoIcons.calendar_today,
          color: Colors.black54,
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
          child: _buildKbResult(),
        ),
      ),
    );
  }
}
