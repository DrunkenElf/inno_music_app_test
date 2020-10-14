part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class EventHomePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class EventLibraryPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class EventSearchPage extends PageEvent {
  @override
  List<Object> get props => [];
}
