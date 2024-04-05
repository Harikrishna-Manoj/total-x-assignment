import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserTile extends StatelessWidget {
  const CustomUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 340.w,
          height: 76.h,
          child: Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              const CircleAvatar(
                radius: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Martin Dokidis",
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "+91 9483754887",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70.w,
              ),
              Text(
                "Age: 34",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
