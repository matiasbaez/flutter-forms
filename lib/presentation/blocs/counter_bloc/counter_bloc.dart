import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterInitial()) {

    on<OnIncreasedEvent>(_onCounterIncreased);
    on<OnResetEvent>(_onCounterReset);

  }

  void _onCounterIncreased( OnIncreasedEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith( counter: state.counter + event.value, transactionCount: state.transactionCount + 1 ));
  }

  void _onCounterReset( OnResetEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith( counter: 0 ));
    // emit(const CounterInitial());
  }

}
