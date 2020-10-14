import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'initial_event.dart';

part 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(StateInitial());

  @override
  Stream<InitialState> mapEventToState(InitialEvent event) async* {
    switch (event.runtimeType) {
      case EventLogged:
        yield StateLogged();
        break;
      case EventLogging:
        yield StateLogging();
        break;
      case EventNotLogged:
        yield StateNotLogged();
        break;
      default:
        yield StateInitial();
        break;
    }
  }
}
