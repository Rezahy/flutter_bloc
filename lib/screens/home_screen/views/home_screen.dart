import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/screens/home_screen/Bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) => Text('$state')),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increament(payload: 1));
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterEvent.increament);
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increament(payload: 2));
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterEvent.increamentTwice);
            },
            child: Icon(Icons.exposure_plus_2),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () async {
              await Future.delayed(Duration(seconds: 5));
              BlocProvider.of<CounterBloc>(context).add(Increament(payload: 5));
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterEvent.increamentR);
            },
            child: Text('R'),
          ),
        ],
      ),
    );
  }
}
