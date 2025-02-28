import 'package:flutter/material.dart';


// ----------------------- Bold -----------------------


TextStyle textBold({
  required double size,
  Color color = Colors.black
}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.bold
  );
}

// ----------------------- Normal -----------------------

TextStyle textNormal({
  required double size,
  Color color = Colors.black
}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.w500
  );
}

// ----------------------- Regular -----------------------

TextStyle textRegular({
  required double size,
  Color color = Colors.black
}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: FontWeight.w300
  );
}