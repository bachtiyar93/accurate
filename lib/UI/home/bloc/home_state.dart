// home/home_state.dart
part of 'home_controller.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<User> users;
  final List<City> citys;

  HomeLoaded(this.users, this.citys);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
