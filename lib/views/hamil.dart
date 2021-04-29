import 'package:belajar_flutter/views/hamil_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HamilView extends StatefulWidget {
  @override
  _HamilViewState createState() => _HamilViewState();
}

class _HamilViewState extends State<HamilView> {
  // final _controller = TextEditingController();
  final _formatter = intl.DateFormat('dd MMMM yyyy');
  DateTime lastHaidDate = DateTime.now();
  DateTime dateToday = DateTime.now();

  Future<Null> _selectDate(BuildContext context, String flag) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: dateToday,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        textDirection: TextDirection.ltr);

    if (_datePicker != null && _datePicker != dateToday) {
      setState(() {
        if (flag == 'first') {
          lastHaidDate = _datePicker;
        } else {
          dateToday = _datePicker;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            // controller: _controller,
            readOnly: true,
            onTap: () => {
              setState(() => {_selectDate(context, 'first')})
            },
            decoration: InputDecoration(
              labelText: 'Tanggal pertama haid terakhir',
              labelStyle: TextStyle(fontSize: 16.0),
              hintText: _formatter.format(lastHaidDate),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
              ),
              suffixIcon: Icon(
                CupertinoIcons.calendar_today,
                color: Colors.black54,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: 24),
          TextFormField(
            // controller: _controller,
            readOnly: true,
            onTap: () => {
              setState(() => {_selectDate(context, 'second')})
            },
            // initialValue: _formatter.format(_today),
            decoration: InputDecoration(
              labelText: 'Tanggal sekarang',
              labelStyle: TextStyle(fontSize: 16.0),
              hintText: _formatter.format(dateToday),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade200, width: 2.0),
              ),
              suffixIcon: Icon(
                CupertinoIcons.calendar_today,
                color: Colors.black54,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HamilResultView(
                        lastHaidDate: lastHaidDate,
                        dateToday: dateToday,
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Text('Hitung'),
            ),
          ),
        ]),
      ),
    );
  }
}
