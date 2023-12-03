
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {

  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _CounterBlocView()
    );
  }
}

class _CounterBlocView extends StatelessWidget {

  const _CounterBlocView();

  void onCounterIncreased( BuildContext context, [ int value = 1] ) {
    context.read<CounterBloc>().add(OnIncreasedEvent(value: value));
  }

  @override
  Widget build(BuildContext context) {

    final counterBlocState = context.watch<CounterBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter: ${counterBlocState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(OnResetEvent()),
            icon: const Icon( Icons.refresh_rounded )
          )
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc value) => Text('Counter value: ${value.state.counter}')
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: '1',
            onPressed: () => onCounterIncreased(context, 3),
            child: const Text('+3')
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: '2',
            onPressed: () => onCounterIncreased(context, 2),
            child: const Text('+2')
          ),

          const SizedBox(height: 15),

          FloatingActionButton(
            heroTag: '3',
            onPressed: () => onCounterIncreased(context),
            child: const Text('+1')
          ),

        ],
      ),
    );
  }
}