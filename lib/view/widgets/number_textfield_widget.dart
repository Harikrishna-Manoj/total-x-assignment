import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberTextWidget extends StatelessWidget {
  const NumberTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController numberTextController = TextEditingController();
    return SizedBox(
      height: 44.h,
      width: 328.w,
      child: Form(
          child: TextFormField(
        // focusNode: FocusNode().nearestScop
        controller: numberTextController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          hintText: "Enter number *",
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      )),
    );
  }
}
