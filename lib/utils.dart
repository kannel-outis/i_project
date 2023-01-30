import 'package:flutter/material.dart';

class Utils {
  static double blockHeight = 0;
  static double blockWidht = 0;

  static void getBlockHeightAndWidth(BuildContext context) {
    blockHeight = MediaQuery.of(context).size.height / 100;
    blockWidht = MediaQuery.of(context).size.width / 100;
  }
}
