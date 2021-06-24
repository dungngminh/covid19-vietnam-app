import 'package:covid19_app/model/detail_province.dart';
import 'package:covid19_app/model/province.dart';
import 'package:covid19_app/service/api_service.dart';
import 'package:covid19_app/view_model/detail_province_viewmodel.dart';
import 'package:flutter/cupertino.dart';

enum LoadingStatus { empty, pending, completed }

class DetailProvinceListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.empty;
  var detailProvinces = <DetailProvinceViewModel>[];

  void getDetailProvince() async {
    List<DetailByProvince> listDetail =
        await ApiService().fetchDetailByProvince();
    List<Province> listProvince = await ApiService().fetchProvince();
    loadingStatus = LoadingStatus.pending;

    notifyListeners();

    this.detailProvinces = listProvince
        .map((province) => DetailProvinceViewModel(
              province: province,
              listDetail: listDetail,
            ))
        .toList();

    if (this.detailProvinces.isEmpty)
      loadingStatus = LoadingStatus.empty;
    else
      loadingStatus = LoadingStatus.completed;

    notifyListeners();
  }
}
