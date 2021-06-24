import 'package:covid19_app/view/widget/table.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailTable(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            print('press');
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Tổng quan",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Thống kê",
            icon: Icon(
              Icons.table_chart_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "Cài đặt",
            icon: Icon(
              Icons.table_chart,
            ),
          ),
        ],
      ),
    );
  }
}
