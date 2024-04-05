import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/pages/login_page/login_page.dart';
import 'package:total_x_assignment/view/pages/user_page/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: const UserPage(),
      ),
    );
  }
}
