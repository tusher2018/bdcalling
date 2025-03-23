import 'package:flutter/material.dart';

Widget commonText(
  String text, {
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.white,
  int? maxLines, // Allow limiting lines
  TextOverflow overflow = TextOverflow.visible, // Default overflow handling
  TextAlign textAlign = TextAlign.start, // Default text alignment
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    softWrap: true,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
