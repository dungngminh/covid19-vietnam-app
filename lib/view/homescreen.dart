import 'package:covid19_app/utils/constant.dart';
import 'package:covid19_app/view/widget/Information.dart';
import 'package:covid19_app/view_model/detail_province_list_viewmodel.dart';
import 'package:covid19_app/view_model/summary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

enum TypeOfInformation { Summary, DetailProvince }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SummaryViewModel>(context, listen: false).getSummary();
    Provider.of<DetailProvinceListViewModel>(context, listen: false)
        .getDetailProvince();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> listProvince = ["All"];

    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          child: SvgPicture.asset(
                            "assets/icons/Drcorona.svg",
                            width: 240,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 190,
                          child: Text(
                            "All you need\nis stay at home",
                            style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/maps-and-flags.svg",
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("Province"),
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        onChanged: (value) {
                          print(value);
    
                        },
                        value: null,
                        items: null,
                          //   .map<DropdownMenuItem<String>>((province) {
                          // return DropdownMenuItem(
                          //   value: province,
                          //   child: Text(
                          //     province,
                          //   ),
                          // );
                        // }).toList(),
                  ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Consumer<SummaryViewModel>(
                        builder: (context, summary, child) {
                      return RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Case Update\n",
                            style: kTitleTextstyle,
                          ),
                          TextSpan(
                              text:
                                  summary.loadingStatus == SummaryStatus.pending
                                      ? "Updating"
                                      : summary.lastUpdate,
                              style: TextStyle(
                                fontSize: 16,
                                color: kTextLightColor,
                              )),
                        ]),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ],
                  ),
                  child: InformationWidget(
                    type: TypeOfInformation.Summary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
