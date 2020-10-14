part of 'splash_bloc.dart';

abstract class EventSplash extends Equatable {
  const EventSplash();
}

class EventLoaded extends EventSplash {
  @override
  List<Object> get props => [];
}

class EventLoading extends EventSplash {
  @override
  List<Object> get props => [];
}
