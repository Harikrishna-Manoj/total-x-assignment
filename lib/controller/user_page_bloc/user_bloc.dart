import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_x_assignment/controller/service/user_service/user_service.dart';
import 'package:total_x_assignment/model/user_model.dart/user_model.dart';
import 'package:total_x_assignment/view/constant/const.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<AdduserDataEvent>((event, emit) async {
      await UserService.addUser(
          userData: event.userData, context: event.context);
      if (event.context.mounted) {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(const SnackBar(content: Text("Details added")));
      }
    });
    on<GetuserDataEvent>((event, emit) async {
      emit(UserLoadingState());
      List<UserModel> usersList = [];
      try {
        usersList = await UserService.fetchNextUsers();
      } catch (e) {
        log(e.toString());
      }
      emit(UserLoadedState(usersList));
    });
    on<SearchuserDataEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.phoneNumber;

      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("${userId!}user").get();
      final List<DocumentSnapshot> docs = querySnapshot.docs.toList();
      List<UserModel> userList = UserService.convertToUsersList(docs);
      List<UserModel> searchList = userList.where((element) {
        if (element.name.toString().toLowerCase().contains(event.searchingText
                .toLowerCase()
                .replaceAll(RegExp(r"\s+"), "")) ||
            element.phoneNumber.toString().toLowerCase().contains(event
                .searchingText
                .toLowerCase()
                .replaceAll(RegExp(r"\s+"), ""))) {
          return true;
        }
        return false;
      }).toList();

      emit(UserLoadedState(searchList));
    });
    on<UserListSortingEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.phoneNumber;

      final QuerySnapshot querySnapshot;
      if (event.sortingAge == sortingConditionList[0]) {
        querySnapshot =
            await FirebaseFirestore.instance.collection("${userId!}user").get();
      } else if (event.sortingAge == sortingConditionList[1]) {
        querySnapshot = await FirebaseFirestore.instance
            .collection("${userId!}user")
            .where("age", isGreaterThan: 60)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection("${userId!}user")
            .where("age", isLessThanOrEqualTo: 60)
            .get();
      }
      final List<DocumentSnapshot> docs = querySnapshot.docs.toList();
      List<UserModel> userList = UserService.convertToUsersList(docs);
      emit(UserLoadedState(userList));
    });
  }
}
