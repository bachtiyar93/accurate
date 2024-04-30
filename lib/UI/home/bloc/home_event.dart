// home/home_event.dart
part of 'home_controller.dart';

abstract class HomeEvent {}

class LoadUser extends HomeEvent {}
class SearchUser extends HomeEvent {
  final String query;

  SearchUser(this.query);
}
class CleanFilter extends HomeEvent {}
class SortUser extends HomeEvent {
  final bool ascending;

  SortUser(this.ascending);
}
