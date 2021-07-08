import 'package:covid19_app/utils/constant.dart';
import 'package:covid19_app/view/homescreen.dart';
import 'package:covid19_app/view/widget/information_counter.dart';
import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:covid19_app/view_model/summary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationWidget extends StatelessWidget {
  InformationWidget({
    required this.type,
    this.nameProvince,
  });

  final TypeOfInformation type;
  final String? nameProvince;

  @override
  Widget build(BuildContext context) {
    return type == TypeOfInformation.Summary
        ? Consumer<SummaryViewModel>(builder: (context, summary, child) {
            return summary.loadingStatus == SummaryStatus.pending
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InformationCounter(
                        information: summary.infectedCase,
                        color: kInfectedColor,
                        subtitle: 'Infected',
                      ),
                      InformationCounter(
                        information: summary.treatedCase,
                        color: kActiveColor,
                        subtitle: 'Active',
                      ),
                      InformationCounter(
                        information: summary.recoveredCase,
                        color: kRecovercolor,
                        subtitle: 'Recovered',
                      ),
                      InformationCounter(
                        information: summary.deceasedCase,
                        color: kDeathColor,
                        subtitle: 'Deceased',
                      ),
                    ],
                  );
          })
        : Consumer<DetailProvinceListViewModel>(
            builder: (context, details, child) {
            int index = 0;
            for (var detail in details.detailProvinces)
              if (detail.provinceName == nameProvince)
                index = details.detailProvinces.indexOf(detail);
            return details.loadingStatus == LoadingStatus.pending
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InformationCounter(
                          information: details.detailProvinces[index].sumOfCase,
                          color: kInfectedColor,
                          fontSize: 30,
                          subtitle: 'Infected',
                        ),
                      ),
                      InformationCounter(
                        information:
                            details.detailProvinces[index].activeCase,
                        color: kActiveColor,
                        subtitle: 'Active',
                      ),
                      InformationCounter(
                        information:
                            details.detailProvinces[index].recoveredCase,
                        color: kRecovercolor,
                        subtitle: 'Recovered',
                      ),
                      InformationCounter(
                        information: details.detailProvinces[index].death,
                        color: kDeathColor,
                        subtitle: 'Deceased',
                      ),
                    ],
                  );
          });
  }
}