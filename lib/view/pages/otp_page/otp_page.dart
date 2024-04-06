import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:total_x_assignment/controller/login_service/otp_login_service.dart';
import 'package:total_x_assignment/view/widgets/custom_action_button.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';
import 'package:total_x_assignment/view/widgets/opt_field.dart';

// ignore: must_be_immutable
class OTPPage extends StatelessWidget {
  OTPPage({super.key, required this.verificationId, required this.phoneNumber});
  final String verificationId;
  final String phoneNumber;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
// String
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
                  "Enter the verification code we just sent to your number +91 *******${phoneNumber.substring(8)}.",
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OTPTextField(textController: textEditingController1),
                      OTPTextField(textController: textEditingController2),
                      OTPTextField(textController: textEditingController3),
                      OTPTextField(textController: textEditingController4),
                      OTPTextField(textController: textEditingController5),
                      OTPTextField(textController: textEditingController6),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: SlideCountdownSeparated(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    duration: const Duration(minutes: 2),
                    separator: "Min",
                    separatorStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp),
                    replacement: Text(
                      "Timeout",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp),
                    ),
                    suffixIcon: Text(
                      "Sec",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp),
                    ),
                    separatorPadding: const EdgeInsets.all(0),
                    onDone: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Timeout")));
                    },
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp),
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
                InkWell(
                  onTap: () {
                    OTPverificationService.signIn(
                        verificationId, "145258", context);
                  },
                  child: const ActionButtons(
                      colr: Colors.black,
                      string: "Verify",
                      stringColor: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
