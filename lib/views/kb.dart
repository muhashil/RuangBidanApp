import 'package:ruang_bidan/views/kb_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class KbView extends StatefulWidget {
  @override
  _KbViewState createState() => _KbViewState();
}

class _KbViewState extends State<KbView> {
  // final _controller = TextEditingController();
  final _formatter = intl.DateFormat('dd MMMM yyyy');
  DateTime _selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
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
              setState(() => {_selectDate(context)})
            },
            decoration: InputDecoration(
              labelText: 'Tanggal Suntik Terakhir',
              labelStyle: TextStyle(fontSize: 16.0),
              hintText: _formatter.format(_selectedDate),
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
                  builder: (context) => KbResultView(
                        selectedDate: _selectedDate,
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
