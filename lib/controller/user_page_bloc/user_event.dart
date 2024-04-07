part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetuserDataEvent extends UserEvent {}

class AdduserDataEvent extends UserEvent {
  final UserModel userData;
  final BuildContext context;

  AdduserDataEvent({required this.userData, required this.context});
}

class SearchuserDataEvent extends UserEvent {
  final String searchingText;

  SearchuserDataEvent(this.searchingText);
}

class UserListSortingEvent extends UserEvent {
  final int sortingAge;

  UserListSortingEvent(this.sortingAge);
}
