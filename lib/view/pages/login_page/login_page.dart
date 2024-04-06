import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/widgets/custom_action_button.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';
import 'package:total_x_assignment/view/widgets/number_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberTextController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 61.h,
              ),
              const LoginImage(
                width: 130,
                height: 102,
                imagePath: "assets/image/pic/login_image.png",
              ),
              SizedBox(
                height: 50.h,
              ),
              const PageHeading(
                heading: "Enter Phone Number",
                textColor: Colors.black,
              ),
              height16,
              CustomTextFieldWidget(
                  hintText: "Enter Phone Number *",
                  textController: phoneNumberTextController,
                  isNumberField: true),
              height16,
              Wrap(
                children: [
                  Text(
                    "By Continuing, I agree to TotalX’s ",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Terms and condition ",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade200),
                  ),
                  Text(
                    "&",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "privacy policy",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade200),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              const ActionButtons(
                  colr: Colors.black,
                  string: "Get OTP",
                  stringColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
