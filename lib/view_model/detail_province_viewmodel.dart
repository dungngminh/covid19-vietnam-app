import 'package:covid19_app/model/detail_province.dart';
import 'package:covid19_app/model/province.dart';
import 'package:covid19_app/utils/extension.dart';

class DetailProvinceViewModel {
  late Province _province;
  late DetailByProvince _detail;

  DetailProvinceViewModel({DetailByProvince? detail, Province? province}) {
    _detail = detail!;
    _province = province!;
  }

  String get provinceName => _province.name.capitalizeFirstofEach;
  String get sumOfCase =>
      (_detail.socadangdieutri! + _detail.socakhoi! + _detail.socatuvong!)
          .toString();
  String get activeCase => _detail.socadangdieutri!.toString();
  String get recoveredCase => _detail.socakhoi!.toString();
  String get death => _detail.socatuvong!.toString();
}
