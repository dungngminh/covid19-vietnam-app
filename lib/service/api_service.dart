import 'package:covid19_app/model/detail_province.dart';
import 'package:covid19_app/model/province.dart';
import 'package:covid19_app/model/summary.dart';
import 'package:http/http.dart' as http;
import 'package:covid19_app/utils/constant.dart';
import 'dart:convert' as convert;

class ApiService {
  Future<List<DetailByProvince>> fetchDetailByProvince() async {
    var url = Uri.parse(Constant.GET_SUMMARY_AND_DETAIL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = convert.jsonDecode(response.body);
      Iterable list = result['detail'];
      return list.map((detail) => DetailByProvince.fromJson(detail)).toList();
    } else
      throw Exception("failed to fetch data");
  }

  Future<List<Province>> fetchProvince() async {
    var url = Uri.parse(Constant.GET_PROVINCE);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = convert.jsonDecode(response.body);
      Iterable list = result['key'];
      return list.map((province) => Province.fromJson(province)).toList();
    } else
      throw Exception("failed to fetch data");
  }

  Future<Summary> fetchSummary() async {
    var url = Uri.parse(Constant.GET_SUMMARY_AND_DETAIL);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = convert.jsonDecode(response.body);
      return Summary(
        sourceUrl: result['sourceUrl'],
        lastUpdatedAtApify: result['lastUpdatedAtApify'],
        infected: result['infected'],
        treated: result['treated'],
        recovered: result['recovered'],
        deceased: result['deceased'],
      );
    } else
      throw Exception("failed to fetch data");
  }
}
