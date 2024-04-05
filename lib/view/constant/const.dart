import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily);
SizedBox height16 = SizedBox(
  height: 16.h,
);
SizedBox height15 = SizedBox(
  height: 15.h,
);
const Color backgroundColor = Color.fromRGBO(235, 235, 235, 1);

List<String> sortingConditionList = ["All", "Age: Elder", "Age: Younger"];
