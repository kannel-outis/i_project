import 'package:flutter/material.dart';

class Utils {
  static double blockHeight = 0;
  static double blockWidht = 0;

  static void getBlockHeightAndWidth(BuildContext context) {
    blockHeight = MediaQuery.of(context).size.height / 100;
    blockWidht = MediaQuery.of(context).size.width / 100;
  }

  static final Gradient gradient = LinearGradient(
    colors: [
      const Color(0xff8D0696).withOpacity(.7),
      const Color(0xffC44BC1).withOpacity(.7),
      const Color(0xff9D0570).withOpacity(.7),
    ],
  );
  static final Gradient borderGradient = LinearGradient(
    colors: [
      const Color(0xff8D0696).withOpacity(.8),
      const Color(0xffC44BC1).withOpacity(.8),
      const Color(0xff9D0570).withOpacity(.8),
    ],
  );
  static const Color backgroundColor = Colors.black87;
  static final double bodyPadding = blockWidht * 8;
  static final double borderRadius = Utils.blockWidht * 3;
}
