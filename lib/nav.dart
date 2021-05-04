import 'package:flutter/material.dart';
import 'package:ruang_bidan/views/hamil.dart';
import 'package:ruang_bidan/views/kb.dart';
import 'package:ruang_bidan/views/imt.dart';



class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List <Widget> _widgetOptions = [
    HamilView(),
    ImtView(),
    KbView(),
  ];

  List <BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.pregnant_woman), label: 'Hamil',),
    BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'IMT', tooltip: 'Indeks Massa Tubuh'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Suntik KB', tooltip: 'Suntik KB 3 Bulan'),
  ];

  void _onTapNavItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruang Bidan'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarItems,
        currentIndex: _selectedIndex,
        onTap: _onTapNavItem,
      ),
    );
  }
}
