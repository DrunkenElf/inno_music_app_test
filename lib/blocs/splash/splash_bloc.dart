import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<EventSplash, SplashState> {
  SplashBloc() : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(EventSplash event) async* {
    switch (event.runtimeType) {
      case EventLoading:
        yield SplashLoading();
        break;
      case EventLoaded:
        yield SplashLoaded();
        break;
      default:
        yield SplashInitial();
        break;
    }
  }
}
