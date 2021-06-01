import 'package:ruang_bidan/views/hamil/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HamilView extends StatefulWidget {
  @override
  _HamilViewState createState() => _HamilViewState();
}

class _HamilViewState extends State<HamilView> {
  // final _controller = TextEditingController();
  final formatter = intl.DateFormat('dd MMMM yyyy');
  DateTime _selectedDate = DateTime.now();

  Future<Null> selectLastHaidDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
        textDirection: TextDirection.ltr);

    if (_datePicker != null && _datePicker != _selectedDate) {
      setState(() {
        _selectedDate = _datePicker;
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
              setState(() => {selectLastHaidDate(context)})
            },
            decoration: InputDecoration(
              labelText: 'Hari Pertama Haid Terakhir (HPHT)',
              labelStyle: TextStyle(fontSize: 18.0),
              hintText: formatter.format(_selectedDate),
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
                        lastHaidDate: _selectedDate,
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
