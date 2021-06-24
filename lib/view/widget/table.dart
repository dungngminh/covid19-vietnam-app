import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/utils/extension.dart';
import 'package:provider/provider.dart';

class DetailTable extends StatefulWidget {
  @override
  _DetailTableState createState() => _DetailTableState();
}

class _DetailTableState extends State<DetailTable> {
   @override
  void initState() {
    super.initState();
    Provider.of<DetailProvinceListViewModel>(context, listen: false)
        .getDetailProvince();
  }
  @override
  Widget build(BuildContext context) {
    var listDetail = Provider.of<DetailProvinceListViewModel>(context);
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text("Tỉnh")),
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
        rows: listDetail.detailProvinces
            .map(
              (e) => DataRow(
                cells: [
                  DataCell(
                    Text(e.provinceName.capitalizeFirstofEach),
                  ),
                  DataCell(
                    Text(e.activeCase),
                  ),
                  DataCell(
                    Text(e.recoveredCase),
                  ),
                  DataCell(
                    Text(e.death),
                  ),
                  DataCell(
                    Text(e.sumOfCase),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
