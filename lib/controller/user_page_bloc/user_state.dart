part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final List<UserModel> userList;

  UserLoadedState(this.userList);
}
