import 'package:bloc_architecture/data/repositories/random_repository.dart';
import 'package:bloc_architecture/logic/bloc/exports.dart';
import 'package:bloc_architecture/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final RandomRepository randomRepository = RandomRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RandomBloc(randomRepository),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
