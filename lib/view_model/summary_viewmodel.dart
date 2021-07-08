import 'package:covid19_app/model/summary.dart';
import 'package:covid19_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum SummaryStatus { none, pending, completed }

class SummaryViewModel with ChangeNotifier {
  Summary? _summary;
  var loadingStatus = SummaryStatus.pending;

  String get getSourceUrl => _summary!.sourceUrl;
  String get lastUpdate =>
      DateFormat.yMMMMEEEEd().add_jm().format(DateFormat("yyyy-MM-ddTHH:mm:ssZ")
          .parse(_summary!.lastUpdatedAtApify, true));
  String get infectedCase => _summary!.infected.toString();
  String get treatedCase => _summary!.treated.toString();
  String get recoveredCase => _summary!.recovered.toString();
  String get deceasedCase => _summary!.deceased.toString();

  Future<void> getSummary() async {
    _summary = await ApiService().fetchSummary();
    loadingStatus = SummaryStatus.pending;
    notifyListeners();

    // ignore: unnecessary_null_comparison
    _summary == null
        ? loadingStatus = SummaryStatus.none
        : loadingStatus = SummaryStatus.completed;
    notifyListeners();
  }
}
