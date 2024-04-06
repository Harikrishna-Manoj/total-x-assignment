import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:total_x_assignment/model/user_model.dart/user_model.dart';
import 'package:total_x_assignment/view/widgets/permission_widget.dart';

class UserService {
  static Future profilePicker(BuildContext context) async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    } else if (status.isPermanentlyDenied) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => const PermissionSettingDialog(),
        );
      }
    } else {
      try {
        final imagePicker = ImagePicker();
        XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

        if (file == null) {
          return;
        }
        File imageFile = File(file.path);
        return imageFile;
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went wrong")));
        }
      }
    }
  }

  static addUser({required UserModel userData}) async {}
}
