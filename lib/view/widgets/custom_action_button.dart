import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key,
      required this.colr,
      required this.string,
      required this.stringColor});

  final Color colr;
  final String string;
  final Color stringColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: colr,
      ),
      height: 44.h,
      width: 328.w,
      child: Center(
          child: Text(
        string,
        style: TextStyle(fontWeight: FontWeight.bold, color: stringColor),
      )),
    );
  }
}
