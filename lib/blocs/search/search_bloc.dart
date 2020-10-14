import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(StateLoading());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is EventLoaded)
      yield StateLoaded();
    else if (event is EventNoNetwork)
      yield StateNoNetwork();
    else
      yield StateLoading();
  }
}
