import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:covid19_app/view_model/detail_province_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailProvinceListViewModel>(context, listen: false)
        .getDetailProvince();
  }

  @override
  Widget build(BuildContext context) {
    var detailProvider = Provider.of<DetailProvinceListViewModel>(context);
    var status = detailProvider.loadingStatus;
    List<DetailProvinceViewModel> listDetail = detailProvider.detailProvinces;
    print(status);
    return status == LoadingStatus.none
        ? Center(
            child: Text("Error"),
          )
        : (status == LoadingStatus.pending
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text("Tỉnh"),
                    ),
                    DataColumn(
                      label: Text(
                        "Đang\nđiều\ntrị",
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Đã\nkhỏi",
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Tử\nvong",
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Tổng\nsố ca",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  rows: listDetail
                      .map(
                        (province) => DataRow(
                          cells: [
                            DataCell(
                              Text(province.provinceName),
                            ),
                            DataCell(
                              Text(province.activeCase),
                            ),
                            DataCell(
                              Text(province.recoveredCase),
                            ),
                            DataCell(
                              Text(province.death),
                            ),
                            DataCell(
                              Text(province.sumOfCase),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ));
  }
}
