import 'package:covid19_app/utils/constant.dart';
import 'package:flutter/material.dart';


class InformationCounter extends StatelessWidget {
  InformationCounter(
      {required this.information,
      required this.subtitle,
      required this.color,
      this.fontSize});

  final String information;
  final Color color;
  final String subtitle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.40),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          information,
          style: TextStyle(
            fontSize: fontSize ?? 26,
            color: color,
          ),
        ),
        Text(
          subtitle,
          style: fontSize == null ? kSubTextStyle2 : kSubTextStyle,
        ),
      ],
    );
  }
}