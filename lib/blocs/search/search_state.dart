part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}
/*
class NetworkState extends SearchState {
  @override
  List<Object> get props => [];
}

class NoNetworkState extends NetworkState {

}*/

class StateNoNetwork extends SearchState {
  @override
  List<Object> get props => [];
}

class StateLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class StateLoaded extends SearchState {
  @override
  List<Object> get props => [];
}
