import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/view/widgets/custom_action_button.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';
import 'package:total_x_assignment/view/widgets/opt_field.dart';

class OTPPage extends StatelessWidget {
  const OTPPage(
      {super.key, required this.verificationId, required this.phoneNumber});
  final String verificationId;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 61.h,
                ),
                const LoginImage(
                  height: 140,
                  width: 140,
                  imagePath: "assets/image/pic/otp_image.png",
                ),
                SizedBox(
                  height: 50.h,
                ),
                const PageHeading(
                  textColor: Colors.black,
                  heading: "OTP Verification",
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Enter the verification code we just sent to your number +91 *******21.",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OTPTextField(),
                      OTPTextField(),
                      OTPTextField(),
                      OTPTextField(),
                      OTPTextField(),
                      OTPTextField(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Text(
                    "59 Sec",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Get OTP? ",
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Resend",
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue.shade200,
                          color: Colors.blue.shade200),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                const ActionButtons(
                    colr: Colors.black,
                    string: "Verify",
                    stringColor: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
