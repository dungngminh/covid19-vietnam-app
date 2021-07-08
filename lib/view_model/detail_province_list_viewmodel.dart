import 'package:covid19_app/model/detail_province.dart';
import 'package:covid19_app/model/province.dart';
import 'package:covid19_app/service/api_service.dart';
import 'package:covid19_app/view_model/detail_province_viewmodel.dart';
import 'package:flutter/cupertino.dart';

enum LoadingStatus { none, pending, completed }

class DetailProvinceListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.pending;
  var detailProvinces = <DetailProvinceViewModel>[];

  Future<void> getDetailProvince() async {
    List<DetailByProvince> listDetail =
        await ApiService().fetchDetailByProvince();
    List<Province> listProvince = await ApiService().fetchProvince();

    for (var province in listProvince) {
      if (indexInApiResult(province, listDetail) != null) {
        this.detailProvinces.add(DetailProvinceViewModel(
              province: province,
              detail: listDetail[indexInApiResult(province, listDetail)!],
            ));
      } else
        continue;
    }
    if (detailProvinces.isEmpty)
      loadingStatus = LoadingStatus.none;
    else
      loadingStatus = LoadingStatus.completed;
    notifyListeners();
  }
}

int? indexInApiResult(Province province, List<DetailByProvince> details) {
  for (int index = 0; index < details.length; index++)
    if (details[index].hcKey == province.hcKey) return index;
}
