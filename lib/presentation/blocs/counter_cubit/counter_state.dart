part of 'counter_cubit.dart';

class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    required this.counter,
    required this.transactionCount
  });

  copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );

  @override
  List<Object?> get props => [counter, transactionCount];

}

final class CounterInitial extends CounterState {

  const CounterInitial({
    required super.counter,
    required super.transactionCount
  });

}

