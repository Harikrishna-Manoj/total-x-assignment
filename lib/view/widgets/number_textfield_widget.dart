import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.textController,
    required this.isNumberField,
    required this.hintText,
  });
  final TextEditingController textController;
  final bool isNumberField;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 328.w,
      child: Form(
          child: TextFormField(
        // focusNode: FocusNode().nearestScop
        controller: textController,
        keyboardType: isNumberField ? TextInputType.number : TextInputType.name,
        inputFormatters:
            isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      )),
    );
  }
}
