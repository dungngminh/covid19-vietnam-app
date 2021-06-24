import 'package:covid19_app/view/mainscreen.dart';
import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid 19 App",
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DetailProvinceListViewModel(),
          )
        ],
        child: MainScreen(),
      ),
    );
  }
}
