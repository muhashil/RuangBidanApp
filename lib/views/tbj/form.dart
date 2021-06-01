import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruang_bidan/views/tbj/result.dart';

class TBJView extends StatefulWidget {
  @override
  _TBJViewState createState() => _TBJViewState();
}

class _TBJViewState extends State<TBJView> {
  List<Map> _isAlreadyPap = [
    {'value': 'yes', 'label': 'Sudah masuk PAP'},
    {'value': 'no', 'label': 'Belum masuk PAP'},
  ];

  Map _selectedPap;
  double _tfu;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              hint: _selectedPap == null
                  ? Text('Apakah kepala sudah masuk PAP?')
                  : Text(_selectedPap['label']),
              items: _isAlreadyPap.map((value) {
                return DropdownMenuItem(
                  child: Text(
                    value['label'],
                  ),
                  value: value,
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Kondisi kepala janin terhadap PAP',
                labelStyle: TextStyle(fontSize: 16.0),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade200, width: 2.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onChanged: (value) {
                setState(() {
                  _selectedPap = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kolom wajib diisi.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tinggi Fundus Uteri (TFU) (cm)',
                labelStyle: TextStyle(fontSize: 16.0),
                hintText: 'Masukan tinggi fundus uteri',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade200, width: 2.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kolom wajib diisi.';
                }

                if (double.parse(value) <= 0) {
                  return 'TFU tidak valid.';
                }
                return null;
              },
              onSaved: (value) {
                _tfu = double.parse(value);
              },
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  return;
                }

                _formKey.currentState.save();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TbjResultView(
                      tfu: _tfu,
                      selectedPap: _selectedPap,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Text('Hitung'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
