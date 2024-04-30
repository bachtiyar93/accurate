import 'dart:convert';
import 'dart:developer';
import 'package:cpssoft/helper/api.dart';
import 'package:cpssoft/helper/endpoint.dart';
import 'package:cpssoft/injections/injections.dart';
import 'package:cpssoft/model/mcity.dart';
import 'package:cpssoft/model/muser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          log('total citys ${citys.length}');
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
      log('search ${event.query}');
      if(event.query!='') {
        filteredUser = users
            .where((user) => user.name!.contains(event.query))
            .toList();
        log('get data ${filteredUser.length}');
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
      String no_filter= 'No Filter';
      if(event.query==no_filter){
        filterCity.clear();
        emit(HomeLoaded(filteredUser,citys));
      }else {
        filterCity = filteredUser
            .where((element) => element.city!.contains(event.query))
            .toList();
        emit(HomeLoaded(filterCity, citys));
      }
    });
  }
}
