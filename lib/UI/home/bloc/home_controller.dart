import 'dart:convert';
import 'dart:developer';
import 'package:cpssoft/helper/api.dart';
import 'package:cpssoft/helper/endpoint.dart';
import 'package:cpssoft/injections/injections.dart';
import 'package:cpssoft/model/mcity.dart';
import 'package:cpssoft/model/muser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<User> users = [];
    List<City> citys=[];
    List<User> filteredUser=[];
    List<User> sortUser=[];
    List<User> filterCity=[];
    on<LoadUser>((event, emit) async {
      emit(HomeLoading());
      try {
        ApiService api = getIt<ApiService>();
        final responseUsers = await api.read(Endpoint.user);
        final responseCity = await api.read(Endpoint.city);

        if (responseUsers.statusCode == 200 && responseCity.statusCode == 200) {
          final List<dynamic> listUser = jsonDecode(responseUsers.body);
          users = listUser.map((json) => User.fromJson(json)).toList();
          final List<dynamic> listCity = jsonDecode(responseCity.body);
          citys = listCity.map((json) => City.fromJson(json)).toList()
              .where((element) => element.address==null||element.email==null).toList();
          filteredUser= List.from(users);
          emit(HomeLoaded(filteredUser, citys,));
        } else {
          emit(HomeError('Failed to load user'));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
    on<SearchUser>((event, emit) {
      if(event.query!='') {
        filteredUser = users
            .where((user) => user.name!.contains(event.query))
            .toList();
        emit(HomeLoaded(filteredUser,citys));
      }else{
        filteredUser.clear();
        filteredUser=users;
          emit(HomeLoaded(filteredUser,citys));
      }
    });
    on<CleanFilter>((event, emit) {
      filteredUser.clear();
      filteredUser=users;
      emit(HomeLoaded(filteredUser,citys));
    });
    on<SortUser>((event, emit) {
      List<String> sort = ['No Filter','A-Z', 'Z-A'];
      if(event.sort==sort[1]) {
        sortUser= List<User>.from(filteredUser)
          ..sort((a, b) => a.name!.compareTo(b.name!));
        log('sort ascending data have ${sortUser.length}');
        emit(HomeLoaded(sortUser, citys));
      }else if(event.sort==sort[2]){
        sortUser= List<User>.from(filteredUser)
          ..sort((a, b) => b.name!.compareTo(a.name!));
        emit(HomeLoaded(sortUser, citys));
      }else{
        sortUser.clear();
        emit(HomeLoaded(filteredUser, citys));
      }
    });
    on<FilterCity>((event, emit) {
      String noFilter= 'No Filter';
      if(event.query==noFilter){
        filterCity.clear();
        emit(HomeLoaded(filteredUser,citys));
      }else {
        filterCity = filteredUser
            .where((element) => element.city!.contains(event.query))
            .toList();
        emit(HomeLoaded(filterCity, citys));
      }
    });
    on<AddNewUser>((event, emit) async {
      showDialog(context: Get.context!, builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }
      );
      try {
        ApiService api = getIt<ApiService>();
        final responseUsers = await api.create(Endpoint.user, body: jsonEncode(event.user.toJson()));
        log('body :${jsonEncode(event.user.toJson())} respond: ${responseUsers.statusCode} ${responseUsers.body} ');
        if (responseUsers.statusCode == 201||responseUsers.statusCode == 200 ) {
          users.add(event.user);
          filteredUser= List.from(users);
          Get.back();
          Get.snackbar('Saved', 'Success add new User (${responseUsers.statusCode})');
          emit(HomeLoaded(filteredUser, citys,));
        } else {
          log('error failed ${responseUsers.body}');
        }
      } catch (e) {
        log('error $e');
      }
      Get.back();
    });
  }
}
