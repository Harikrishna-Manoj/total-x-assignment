import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height.h,
        width: width.w,
        child: Image.asset(imagePath),
      ),
    );
  }
}

class PageHeading extends StatelessWidget {
  const PageHeading({
    super.key,
    required this.heading,
    required this.textColor,
  });
  final String heading;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.w600, color: textColor),
    );
  }
}
