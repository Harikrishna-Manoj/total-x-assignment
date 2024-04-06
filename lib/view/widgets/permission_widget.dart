import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionSettingDialog extends StatelessWidget {
  const PermissionSettingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      content: Text(
        "Permission Permanently Denied",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: () {
            openAppSettings();
            Navigator.pop(context);
          },
          child: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
