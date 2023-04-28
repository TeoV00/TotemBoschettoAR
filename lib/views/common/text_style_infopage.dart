import 'package:flutter/material.dart';

const titleStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.w900);
const headerStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
const paragraphStyle = TextStyle(fontSize: 25);

Text makeTitle(String titleText) {
  return _makeText(titleText, titleStyle);
}

Widget makeHeader(String headerText) {
  return Padding(
    padding: const EdgeInsets.only(top: 40, bottom: 5),
    child: _makeText(headerText, headerStyle),
  );
}

Text makeParagraph(String paragraphText) {
  return _makeText(paragraphText, paragraphStyle);
}

Text _makeText(String text, TextStyle style) {
  return Text(
    text,
    style: style,
  );
}
