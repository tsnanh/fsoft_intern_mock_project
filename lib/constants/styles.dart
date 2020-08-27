import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Map<int, Color> _color =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };
  static const primaryColor = MaterialColor(0xFF4CAF50, _color);
  static final headline1 = GoogleFonts.satisfy(
    fontSize: 117,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5
  );
  static final headline2 = GoogleFonts.satisfy(
    fontSize: 73,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5
  );
  static final headline3 = GoogleFonts.satisfy(
    fontSize: 58,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );
  static final headline4 = GoogleFonts.satisfy(
    fontSize: 41,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25
  );
  static final headline5 = GoogleFonts.satisfy(
    fontSize: 29,
    fontWeight: FontWeight.normal,
    letterSpacing: 0
  );
  static final headline6 = GoogleFonts.satisfy(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: .15
  );
}
