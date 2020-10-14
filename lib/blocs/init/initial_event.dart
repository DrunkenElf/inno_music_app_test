part of 'initial_bloc.dart';

abstract class InitialEvent extends Equatable {
  const InitialEvent();
}

class EventInit extends InitialEvent {
  @override
  List<Object> get props => [];
}

class EventNotLogged extends InitialEvent {
  @override
  List<Object> get props => [];
}

class EventLogged extends InitialEvent {
  @override
  List<Object> get props => [];
}

class EventLogging extends InitialEvent {
  @override
  List<Object> get props => [];
}
