import 'dart:convert';
import 'package:cpssoft/helper/api.dart';
import 'package:cpssoft/helper/endpoint.dart';
import 'package:cpssoft/injections/injections.dart';
import 'package:cpssoft/model/Mcity.dart';
import 'package:cpssoft/model/Muser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<User> users = [];
    List<City> citys=[];
    on<LoadUser>((event, emit) async {
      emit(HomeLoading());
      try {
        ApiService api = getIt<ApiService>();
        final responseUsers = await api.read(Endpoint.user);
        final responseCity = await api.read(Endpoint.city);

        if (responseUsers.statusCode == 200 && responseCity.statusCode == 200) {
          final List<dynamic> listUser = jsonDecode(responseUsers.body);
          users = listUser.map((json) => User.fromJson(json)).toList();
          final List<dynamic> listCity = jsonDecode(responseUsers.body);
          citys = listCity.map((json) => City.fromJson(json)).toList();
          emit(HomeLoaded(users, citys));
        } else {
          emit(HomeError('Failed to load user'));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
    on<SearchUser>((event, emit) {
      final searchResult = users.where((user) => user.name!.contains(event.query) && user.city!.contains(event.city)).toList();
      emit(HomeLoaded(searchResult, citys));
    });
  }
}
