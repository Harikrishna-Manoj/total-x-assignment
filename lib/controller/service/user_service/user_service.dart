import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:total_x_assignment/model/user_model.dart/user_model.dart';
import 'package:total_x_assignment/view/widgets/permission_widget.dart';

class UserService {
  static bool hasNext = true;
  static bool isFetchingUsers = false;

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

  static Future<String> uploadImage(File imageFile) async {
    late String? downloadedUrl;

    final referenceRoot = FirebaseStorage.instance.ref();
    final referenceDirImage = referenceRoot.child('profile');
    final referenceImageToupload = referenceDirImage
        .child(DateTime.now().millisecondsSinceEpoch.toString());
    try {
      await referenceImageToupload.putFile(imageFile);
      downloadedUrl = await referenceImageToupload.getDownloadURL();
    } catch (e) {
      return e.toString();
    }
    return downloadedUrl;
  }

  static addUser(
      {required UserModel userData, required BuildContext context}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.phoneNumber;
      CollectionReference userRef =
          FirebaseFirestore.instance.collection("${userId!}user");
      final userDoc = userRef.doc();
      await userDoc.set(userData.toJason());
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something went wrong"),
          ),
        );
      }
    }
  }

  static Future fetchNextUsers() async {
    // if (isFetchingUsers) return;

    int limit = 10;
    // isFetchingUsers = true;

    try {
      List<UserModel> userModelList = [];
      final usersSnapshot = <DocumentSnapshot>[];
      final snap = await getUsers(
        limit,
        startAfter: usersSnapshot.isNotEmpty ? usersSnapshot.last : null,
      );
      usersSnapshot.addAll(snap.docs);
      userModelList = convertToUsersList(usersSnapshot);

      if (snap.docs.length < limit) hasNext = false;
      return userModelList;
    } catch (e) {
      log("${e.toString()}hai");
    }
    // isFetchingUsers = false;
  }

  static Future getUsers(
    int limit, {
    required DocumentSnapshot? startAfter,
  }) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.phoneNumber;

      final collectionReference = FirebaseFirestore.instance
          .collection("${userId!}user")
          .orderBy("age");
      if (startAfter == null) {
        return collectionReference.get();
      } else {
        return collectionReference.startAfterDocument(startAfter).get();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static List<UserModel> convertToUsersList(List<DocumentSnapshot> documents) {
    return documents.map((snapshot) {
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    }).toList();
  }
}
