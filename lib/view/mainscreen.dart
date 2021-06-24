import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailProvinceListViewModel>(context, listen: false)
        .getDetailProvince();
  }

  @override
  Widget build(BuildContext context) {
    var listDetail = Provider.of<DetailProvinceListViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: listDetail.detailProvinces.length,
          itemBuilder: (context, index) {
            return Text(listDetail.detailProvinces[index].provinceName +
                "             Tổng số ca : " +
                listDetail.detailProvinces[index].sumOfCase);
          }),
    );
  }
}
