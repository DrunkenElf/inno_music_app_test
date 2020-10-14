import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';

part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageHomeState());

  //PageBloc(PageState initialState) : super(initialState);

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is EventLibraryPage)
      yield PageLibraryState();
    else if (event is EventSearchPage)
      yield PageSearchState();
    else
      yield PageHomeState();
  }
}
