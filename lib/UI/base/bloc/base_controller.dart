import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(BaseInitial()) {
    on<AppStarted>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(BaseToHome());
    });
  }
}
