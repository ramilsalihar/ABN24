import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './core/bloc/bloc_observer.dart';
import './core/di/dependency_injections.dart';
import './presentation/application/application.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  injectAllDependencies();

  runApp(const ABN24());
}
