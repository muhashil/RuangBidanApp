import 'package:flutter/material.dart';
import 'package:ruang_bidan/views/hamil/form.dart';
import 'package:ruang_bidan/views/kb/form.dart';
import 'package:ruang_bidan/views/imt/form.dart';
import 'package:ruang_bidan/views/tbj/form.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    HamilView(),
    TBJView(),
    ImtView(),
    KbView(),
  ];

  List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.pregnant_woman,
        ),
        label: 'Hamil',
        tooltip: 'Hari Perkiraan Lahir'),
    BottomNavigationBarItem(
        icon: Icon(
          MdiIcons.weightGram,
        ),
        label: 'TBJ',
        tooltip: 'Taksiran Berat Janin'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.calculate,
        ),
        label: 'IMT',
        tooltip: 'Indeks Massa Tubuh'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_today,
        ),
        label: 'Suntik KB',
        tooltip: 'Suntik KB'),
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
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
      ),
    );
  }
}
