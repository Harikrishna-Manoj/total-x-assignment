import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:total_x_assignment/controller/service/user_service/user_service.dart';
import 'package:total_x_assignment/model/user_model.dart/user_model.dart';

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
      usersList.addAll(await UserService.fetchNextUsers());
      emit(UserLoadedState(usersList));
    });
    on<SearchuserDataEvent>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser!.phoneNumber;

      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("${userId!}user").get();
      final List<DocumentSnapshot> docs = querySnapshot.docs.toList();
      List<UserModel> productList = UserService.convertToUsersList(docs);
      List<UserModel> searchList = productList.where((element) {
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
  }
}
