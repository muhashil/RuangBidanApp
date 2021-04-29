import 'package:flutter/material.dart';
import 'package:belajar_flutter/views/imt_result.dart';

class ImtView extends StatefulWidget {
  @override
  _ImtViewState createState() => _ImtViewState();
}

class _ImtViewState extends State<ImtView> {
  int _beforeWeight;
  int _height;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Berat badan sebelum hamil (kg)',
                  labelStyle: TextStyle(fontSize: 16.0),
                  // hintText: 'Tulis angka disini',
                  // hintStyle: TextStyle(fontSize: 12.0),
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
                  return null;
                },
                onSaved: (value) {
                  _beforeWeight = int.parse(value);
                },
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                  labelStyle: TextStyle(fontSize: 16.0),
                  // hintText: 'Tulis angka disini',
                  // hintStyle: TextStyle(fontSize: 12.0),
                  // hintText: '',
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
                  return null;
                },
                onSaved: (value) {
                  _height = int.parse(value);
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImtResultView(
                        beratBadanBefore: _beforeWeight,
                        tinggiBadan: _height,
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
      ),
    );
  }
}
