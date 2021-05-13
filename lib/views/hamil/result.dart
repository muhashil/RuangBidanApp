import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HamilResultView extends StatelessWidget {
  final DateTime lastHaidDate;
  final formatter = intl.DateFormat('dd MMMM yyyy');
  int dayReduction = 7;
  int monthReduction = 3;
  int yearAddition = 1;
  Map tabelKehamilan = {
    8: {'rerata_bb': 1, 'rerata_tinggi': 4.0, 'rerata_bb_ibu': 0.5},
    9: {'rerata_bb': 4, 'rerata_tinggi': 4.0, 'rerata_bb_ibu': 0.7},
    10: {'rerata_bb': 10, 'rerata_tinggi': 6.5, 'rerata_bb_ibu': 0.9},
    11: {'rerata_bb': 15, 'rerata_tinggi': 6.5, 'rerata_bb_ibu': 1.1},
    12: {'rerata_bb': 20, 'rerata_tinggi': 9.0, 'rerata_bb_ibu': 1.4},
    13: {'rerata_bb': 50, 'rerata_tinggi': 9.0, 'rerata_bb_ibu': 1.7},
    14: {'rerata_bb': 85, 'rerata_tinggi': 12.5, 'rerata_bb_ibu': 2.0},
    15: {'rerata_bb': 100, 'rerata_tinggi': 12.5, 'rerata_bb_ibu': 2.3},
    16: {'rerata_bb': 110, 'rerata_tinggi': 16.0, 'rerata_bb_ibu': 2.7},
    17: {'rerata_bb': 180, 'rerata_tinggi': 16.0, 'rerata_bb_ibu': 3.0},
    18: {'rerata_bb': 210, 'rerata_tinggi': 20.5, 'rerata_bb_ibu': 3.4},
    19: {'rerata_bb': 300, 'rerata_tinggi': 20.5, 'rerata_bb_ibu': 3.8},
    20: {'rerata_bb': 325, 'rerata_tinggi': 25.0, 'rerata_bb_ibu': 4.3},
    21: {'rerata_bb': 400, 'rerata_tinggi': 25.0, 'rerata_bb_ibu': 4.7},
    22: {'rerata_bb': 485, 'rerata_tinggi': 27.5, 'rerata_bb_ibu': 5.1},
    23: {'rerata_bb': 550, 'rerata_tinggi': 27.5, 'rerata_bb_ibu': 5.5},
    24: {'rerata_bb': 685, 'rerata_tinggi': 30.0, 'rerata_bb_ibu': 5.9},
    25: {'rerata_bb': 750, 'rerata_tinggi': 30.0, 'rerata_bb_ibu': 6.4},
    26: {'rerata_bb': 890, 'rerata_tinggi': 32.5, 'rerata_bb_ibu': 6.8},
    27: {'rerata_bb': 1000, 'rerata_tinggi': 32.5, 'rerata_bb_ibu': 7.2},
    28: {'rerata_bb': 1150, 'rerata_tinggi': 35.0, 'rerata_bb_ibu': 7.4},
    29: {'rerata_bb': 1300, 'rerata_tinggi': 35.0, 'rerata_bb_ibu': 7.7},
    30: {'rerata_bb': 1460, 'rerata_tinggi': 37.5, 'rerata_bb_ibu': 8.1},
    31: {'rerata_bb': 1610, 'rerata_tinggi': 37.5, 'rerata_bb_ibu': 8.4},
    32: {'rerata_bb': 1810, 'rerata_tinggi': 40.0, 'rerata_bb_ibu': 8.8},
    33: {'rerata_bb': 2000, 'rerata_tinggi': 40.0, 'rerata_bb_ibu': 9.1},
    34: {'rerata_bb': 2250, 'rerata_tinggi': 42.5, 'rerata_bb_ibu': 9.5},
    35: {'rerata_bb': 2500, 'rerata_tinggi': 42.5, 'rerata_bb_ibu': 10.0},
    36: {'rerata_bb': 2690, 'rerata_tinggi': 45.0, 'rerata_bb_ibu': 10.4},
    37: {'rerata_bb': 2900, 'rerata_tinggi': 45.0, 'rerata_bb_ibu': 10.5},
    38: {'rerata_bb': 3050, 'rerata_tinggi': 47.5, 'rerata_bb_ibu': 11.0},
    39: {'rerata_bb': 3200, 'rerata_tinggi': 47.5, 'rerata_bb_ibu': 11.3},
    40: {'rerata_bb': 3300, 'rerata_tinggi': 50.0, 'rerata_bb_ibu': 11.3},
    41: {'rerata_bb': 3400, 'rerata_tinggi': 50.0, 'rerata_bb_ibu': 11.3},
    42: {'rerata_bb': 3450, 'rerata_tinggi': 52.5, 'rerata_bb_ibu': 11.3}
  };

  HamilResultView({
    Key key, 
    @required this.lastHaidDate,
  }) : super(key: key);

  int _getDateDifference(date) {
    // return date difference from today 
    return DateTime.now().difference(date).inDays;
  }

  Widget _buildBirthdayEstimation() {
    int nextMonth = lastHaidDate.month + 1;
    if (nextMonth == 13) {
      nextMonth = 1;
    }
    int lastDayMonth = DateTime(lastHaidDate.year, nextMonth, 0).day;

    int dayResult = lastHaidDate.day + dayReduction;
    if (dayResult > lastDayMonth) {
      dayResult = dayResult - lastDayMonth;
      monthReduction -= 1;
    }

    int monthResult = lastHaidDate.month - monthReduction;
    if (monthResult <= 0) {
      monthResult = monthResult + 12;
      yearAddition -= 1;
    }

    int yearResult = lastHaidDate.year + yearAddition;
    DateTime hpl = DateTime(yearResult, monthResult, dayResult);

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Hari perkiraan lahir',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: formatter.format(hpl),
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildPregnancyAge() {
    int days = _getDateDifference(lastHaidDate) % 7;
    int weeks = _getDateDifference(lastHaidDate) ~/ 7;
    weeks = weeks.toInt();

    String umurHamil = "${weeks} minggu";
    if (days > 0) {
      umurHamil += " ${days} hari";
    }

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Umur Kehamilan',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: umurHamil,
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildTrimester() {
    int weeks = _getDateDifference(lastHaidDate) ~/ 7;
    weeks = weeks.toInt();

    int trimester = 0;
    if (weeks <= 13) {
      trimester = 1;
    } else if (weeks > 13 && weeks <= 26) {
      trimester = 2;
    } else {
      trimester = 3;
    }

    String trimesterResult = 'I' * trimester;

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Trimester ke',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: trimesterResult,
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildJaninWeight() {
    int weeks = _getDateDifference(lastHaidDate) ~/ 7;
    String result = '';

    var dataKehamilan = tabelKehamilan[weeks];
    if (dataKehamilan == null) {
      result = '-';
    } else {
      int janinWeight = dataKehamilan['rerata_bb'];
      result = '${janinWeight} gr';
    }

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Rata-rata berat badan janin (gram)',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: result,
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildJaninHeight() {
    int weeks = _getDateDifference(lastHaidDate) ~/ 7;
    String result = '';

    var dataKehamilan = tabelKehamilan[weeks];
    if (dataKehamilan == null) {
      result = '-';
    } else {
      double janinHeight = dataKehamilan['rerata_tinggi'];
      result = '${janinHeight} cm';
    }

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Rata-rata tinggi badan janin',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: result,
        // hintStyle: TextStyle(fontSize: 12.0),
        // hintText: '',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget _buildMotherWeightGrowth() {
    int weeks = _getDateDifference(lastHaidDate) ~/ 7;
    String result = '';

    var dataKehamilan = tabelKehamilan[weeks];
    if (dataKehamilan == null) {
      result = '-';
    } else {
      double motherWeightGrowth = dataKehamilan['rerata_bb_ibu'];
      result = '${motherWeightGrowth} kg';
    }

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Rata-rata pertambahan BB ibu',
        labelStyle: TextStyle(fontSize: 18.0),
        hintText: result,
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
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              readOnly: true,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                enabled: true,
                labelText: 'Tanggal pertama haid terakhir',
                labelStyle: TextStyle(fontSize: 18.0),
                hintText: formatter.format(lastHaidDate),
                // hintStyle: TextStyle(fontSize: 12.0),
                // hintText: '',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade200, width: 2.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 24),
            _buildBirthdayEstimation(),
            SizedBox(height: 24),
            _buildPregnancyAge(),
            SizedBox(height: 24),
            _buildTrimester(),
            SizedBox(height: 24),
            _buildJaninHeight(),
            SizedBox(height: 24),
            _buildJaninWeight(),
            SizedBox(height: 24),
            _buildMotherWeightGrowth(),
          ],
        ),
      ),
    );
  }
}
