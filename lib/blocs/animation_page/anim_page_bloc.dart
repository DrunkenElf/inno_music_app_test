import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'anim_page_event.dart';

part 'anim_page_state.dart';

class AnimPageBloc extends Bloc<AnimPageEvent, AnimPageState> {
  AnimPageBloc() : super(AnimPageInitial());

  @override
  Stream<AnimPageState> mapEventToState(
    AnimPageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
