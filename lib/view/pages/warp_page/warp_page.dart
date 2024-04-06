import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:total_x_assignment/view/pages/login_page/login_page.dart';
import 'package:total_x_assignment/view/pages/user_page/user_list_page.dart';

class WarpPage extends StatelessWidget {
  const WarpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const UserPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
