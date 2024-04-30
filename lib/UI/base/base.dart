import 'package:cpssoft/UI/base/bloc/base_controller.dart';
import 'package:cpssoft/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BaseBloc()..add(AppStarted()),
      child: BlocListener<BaseBloc, BaseState>(
        listener: (context, state) {
          if (state is BaseToHome) {
            Get.offAllNamed(Main.home);
          }
        },
        child: Scaffold(
          body: Center(
              child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset('assets/logo.png', fit: BoxFit.fitHeight,),
              ),
              const Center(child: CircularProgressIndicator()),
            ],
          )),
        ),
      ),
    );
  }
}
