import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({
    super.key,
    required this.textController,
  });
  final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 44.h,
        width: 44.h,
        child: TextFormField(
          controller: textController,
          cursorColor: Colors.red,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1)
          ],
          onChanged: (value) {
            if (value.isNotEmpty) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.red, fontSize: 18.sp),
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              focusColor: Colors.black),
        ));
  }
}
