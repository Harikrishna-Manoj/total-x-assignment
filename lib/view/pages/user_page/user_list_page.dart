import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/view/constant/const.dart';
import 'package:total_x_assignment/view/widgets/login_image.dart';
import 'package:total_x_assignment/view/widgets/search_field_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(69.h),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              SizedBox(
                width: 3.w,
              ),
              const PageHeading(
                heading: "Nilambur",
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 297.w,
                    height: 44.h,
                    child: const SearchField(),
                  ),
                  SizedBox(
                    height: 32.h,
                    width: 32.w,
                    child: Image.asset("assets/image/icons/sort_icon.png"),
                  )
                ],
              ),
              height15,
              const PageHeading(heading: "Users List", textColor: Colors.black),
              height15,
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizedBox(
                          width: 340.w, height: 76.h, child: const ListTile()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
