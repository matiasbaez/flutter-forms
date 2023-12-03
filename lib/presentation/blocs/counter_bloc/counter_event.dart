part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent extends Equatable {

  const CounterEvent();

  @override
  List<Object> get props => [];

}

class OnIncreasedEvent extends CounterEvent {
  final int value;
  const OnIncreasedEvent({ required this.value });
}
class OnResetEvent extends CounterEvent {}