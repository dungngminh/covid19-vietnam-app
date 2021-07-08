import 'package:flutter/material.dart';

class Constant {
  static const String GET_SUMMARY_AND_DETAIL =
      "https://api.apify.com/v2/key-value-stores/ZsOpZgeg7dFS1rgfM/records/LATEST?fbclid=IwAR3txH-7FSS6qFxGdyc2nSjcThRHFANwUaIqzAP6pvQ2177oqIDD3u6W6do";

  static const String GET_PROVINCE =
      "https://api.apify.com/v2/key-value-stores/p3nS2Q9TUn6kUOriJ/records/LATEST?fbclid=IwAR33CvaRq7Ejxkw3EQAaSyk7ysj1A2Ylq51nJawqLexE_jSt2J52IbFp5z0";
}

// Colors
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kDeathColor = Color.fromRGBO(102, 102, 102, 1);
const kActiveColor = Color(0xFFFF8748);
const kInfectedColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFF4056C6).withOpacity(.15);

// Text Style
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

const kSubTextStyle = TextStyle(fontSize: 14, color: kTextLightColor);
const kSubTextStyle2 = TextStyle(fontSize: 12, color: kTextLightColor);

const kTitleTextstyle = TextStyle(
  fontSize: 18,
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);
