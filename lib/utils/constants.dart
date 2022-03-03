import 'package:flutter/material.dart';
// App color constants
const Color primaryColor = Color(0xFF5262F6);
const Color bgColor = Color(0xFFFBFBFD);
const Color  itemBackgroundColor= Color(0xFFEFEFF2);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

List<BoxShadow> neumorpShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5), spreadRadius: -5, offset: Offset(-5, -5), blurRadius: 30),
  BoxShadow(
      color: Colors.blue[900]!.withOpacity(.2),
      spreadRadius: 2,

      offset: Offset(7, 7),
      blurRadius: 20)
];