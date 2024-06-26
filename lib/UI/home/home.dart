import 'package:cpssoft/UI/home/bloc/home_controller.dart';
import 'package:cpssoft/UI/home/card.dart';
import 'package:cpssoft/UI/home/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadUser()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return  loading();
          }
          else if (state is HomeLoaded) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120.0),
                child: AppBar(
                  toolbarHeight: 200,
                  flexibleSpace: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Search(citys: state.citys,)),
                ),
              ),
              body: state.users.isEmpty?const Center(child: Text('Data is Empty')):ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index)  =>CardUser(user: state.users[index]),
              ),
            );
          } else if (state is HomeError) {
            return Text('Error: ${state.message}');
          }
          return Container();
        },
      ),
    );
  }
  loading() {
    return Scaffold(
      appBar: AppBar(
          title: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child:  Container(
                width: 150,
                height: 30.0,
                color: Colors.white,
                alignment: Alignment.centerLeft,
              )
          )
      ),
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 100,
            itemBuilder: (context, index)  => Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 48.0,
                    height: 48.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: 40.0,
                          height: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




