import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/controller/user_page_bloc/user_bloc.dart';
import 'package:total_x_assignment/firebase_options.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/pages/warp_page/warp_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: BlocProvider(
        create: (context) => UserBloc(),
        child: MaterialApp(
            theme: themeData,
            debugShowCheckedModeBanner: false,
            home: const WarpPage()),
      ),
    );
  }
}
