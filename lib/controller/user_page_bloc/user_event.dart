part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetuserDataEvent extends UserEvent {}

class AdduserDataEvent extends UserEvent {
  final UserModel userData;

  AdduserDataEvent(this.userData);
}

class SearchuserDataEvent extends UserEvent {
  final String searchingText;

  SearchuserDataEvent(this.searchingText);
}
