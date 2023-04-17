import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_architecture/app.dart';
import 'package:bloc_architecture/general_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(App());
}
