import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_example/app/app.dart';
import 'package:flutter_graphql_example/app/bloc_observer.dart';
import 'package:flutter_graphql_example/utils/my_local.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(const App());
}
