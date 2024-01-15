import 'package:flutter/material.dart';

Widget verticalSeparator() {
  return const SizedBox(
    height: 20.0,
  );
}

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
