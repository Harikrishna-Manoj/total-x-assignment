import 'package:flutter/material.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            PageHeading(
              heading: "Nilambur",
              textColor: Colors.white,
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
