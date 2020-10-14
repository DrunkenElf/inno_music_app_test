part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class EventNoNetwork extends SearchEvent {
  @override
  List<Object> get props => [];
}

class EventLoading extends SearchEvent {
  @override
  List<Object> get props => [];
}

class EventLoaded extends SearchEvent {
  @override
  List<Object> get props => [];
}
