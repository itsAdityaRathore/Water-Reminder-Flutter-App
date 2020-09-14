import 'package:flutter/material.dart';

const kSkyBlue = const Color(0xff79CBF5);
const kBaseBlue = const Color(0xff98D6F6);
const kLightBlue = const Color(0xffD9E8F5);
const kLightGrey = const Color(0xffDAD4D6);
const kDarkGrey = const Color(0xff8D8B8B);
const kBaseGrey = const Color(0xffDAB4B1);
const kBaseWhite = const Color(0xffF8F9FB);
const kBlueGrey = const Color(0xffA6B6D1);
const kDeepBlue = const Color(0xff3299E8);
const kmatteBlack = const Color(0xff262323);
const kDarkBlueGrey = const Color(0xff47769A);

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);
