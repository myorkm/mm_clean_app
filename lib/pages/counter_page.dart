import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_page_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterPageBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: const Center(child: _HomePageContent()),
      ),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        BlocBuilder<CounterPageBloc, CounterPageState>(
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterPageBloc>().add(IncrementCounter());
          },
        ),
      ],
    );
  }
}
