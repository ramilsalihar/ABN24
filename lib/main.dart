import 'package:abn24/presentation/application/application.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import './core/bloc/bloc_observer.dart';
import 'core/di/dependency_injections.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  injectAllDependencies();
  runApp(const ABN24());
}