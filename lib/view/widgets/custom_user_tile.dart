import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:total_x_assignment/model/user_model.dart/user_model.dart';

class CustomUserTile extends StatelessWidget {
  const CustomUserTile({
    super.key,
    required this.userList,
    required this.index,
  });
  final List<UserModel> userList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: SizedBox(
            width: 340.w,
            height: 76.h,
            child: Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(userList[index].imageUrl),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userList[index].name,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        userList[index].phoneNumber,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 16.w,
          bottom: 76.h * 0.26,
          child: Text(
            "Age: ${userList[index].age}",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
