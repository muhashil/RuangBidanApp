import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class KbResultView extends StatelessWidget {
  final Map kbType;
  final DateTime kbDateBefore;
  final _formatter = intl.DateFormat('dd MMMM yyyy');

  KbResultView({
    Key key,
    @required this.kbDateBefore,
    @required this.kbType,
  }) : super(key: key);

  Widget _buildKbType() {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Rentang Suntik KB',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: kbType['label'],
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildKbBefore() {

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Suntik KB Terakhir',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: _formatter.format(kbDateBefore),
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

  Widget _buildKbResult() {
    int dateAdd = 0;
    if (kbType['value'] == 'one') {
      dateAdd = 28;
    } else if (kbType['value'] == 'three') {
      dateAdd = 84;
    }

    DateTime kbDateNext = kbDateBefore.add(Duration(days: dateAdd));

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Suntik KB Selanjutnya',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: _formatter.format(kbDateNext),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        suffixIcon: Icon(
          CupertinoIcons.calendar_today,
          color: Colors.black54,
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
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildKbType(),
              SizedBox(height: 24),
              _buildKbBefore(),
              SizedBox(height: 24),
              _buildKbResult(),
            ],
          ),
        ),
      ),
    );
  }
}
