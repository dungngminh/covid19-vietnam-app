import 'package:covid19_app/model/detail_province.dart';
import 'package:covid19_app/model/province.dart';

class DetailProvinceViewModel {
  late Province _province;
  late List<DetailByProvince> _listDetail = <DetailByProvince>[];

  DetailProvinceViewModel(
      {List<DetailByProvince>? listDetail, Province? province}) {
    _listDetail = listDetail!;
    _province = province!;
  }

  String get provinceName {
    for (var detail in _listDetail)
      if (detail.hcKey == _province.hcKey) return _province.name;
    return "";
  }
  String get sumOfCase {
    for (var detail in _listDetail)
      if (detail.hcKey == _province.hcKey)
        return (detail.socakhoi + detail.socadangdieutri + detail.socatuvong)
            .toString();
    return "";
  }

  String get recoveredCase {
    for (var detail in _listDetail)
      if (detail.hcKey == _province.hcKey) return detail.socakhoi.toString();
    return "";
  }

  String get activeCase {
    for (var detail in _listDetail)
      if (detail.hcKey == _province.hcKey)
        return detail.socadangdieutri.toString();
    return "";
  }

  String get death {
    for (var detail in _listDetail)
      if (detail.hcKey == _province.hcKey) return detail.socatuvong.toString();
    return "";
  }

}
