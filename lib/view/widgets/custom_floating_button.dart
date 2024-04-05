import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/widgets/number_textfield_widget.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameTextController = TextEditingController();
    TextEditingController ageTextController = TextEditingController();
    TextEditingController phoneNumberTextController = TextEditingController();

    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                content: SizedBox(
                  width: 339.w,
                  height: 400.h,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add A New User",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Center(
                          child: SizedBox(
                            height: 80.h,
                            width: 85.w,
                            child: Image.asset(
                                "assets/image/icons/user_image_icon.png"),
                          ),
                        ),
                        height16,
                        CustomUserTextField(
                            isNumberField: false,
                            textController: nameTextController,
                            title: "Name"),
                        height16,
                        CustomUserTextField(
                            isNumberField: true,
                            textController: ageTextController,
                            title: "Age"),
                        height16,
                        CustomUserTextField(
                            isNumberField: true,
                            textController: phoneNumberTextController,
                            title: "Phone number"),
                      ],
                    ),
                  ),
                ),
                actions: [
                  DialogActionButton(
                      action: () => Navigator.pop(context),
                      actionText: "Cancel",
                      buttonColor: Colors.grey.shade400,
                      textColor: Colors.black),
                  DialogActionButton(
                      action: () {
                        Navigator.pop(context);
                      },
                      actionText: "Save",
                      buttonColor: Colors.blue,
                      textColor: Colors.white),
                ],
              );
            });
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}

class DialogActionButton extends StatelessWidget {
  const DialogActionButton({
    super.key,
    required this.action,
    required this.actionText,
    required this.buttonColor,
    required this.textColor,
  });
  final VoidCallback action;
  final String actionText;
  final Color buttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 33.w),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        backgroundColor: buttonColor,
      ),
      onPressed: action,
      child: Text(
        actionText,
        style: TextStyle(fontSize: 12.sp, color: textColor),
      ),
    );
  }
}

class CustomUserTextField extends StatelessWidget {
  const CustomUserTextField({
    super.key,
    required this.textController,
    required this.title,
    required this.isNumberField,
  });

  final TextEditingController textController;
  final String title;
  final bool isNumberField;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 11.h),
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        CustomTextFieldWidget(
            hintText: "",
            textController: textController,
            isNumberField: isNumberField)
      ],
    );
  }
}
