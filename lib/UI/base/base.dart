import 'package:cpssoft/UI/base/bloc/base_controller.dart';
import 'package:cpssoft/main.dart';
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
        child: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
