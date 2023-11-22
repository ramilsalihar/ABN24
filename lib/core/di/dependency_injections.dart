import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../presentation/modules/home/bloc/home_cubit.dart';

void injectAllDependencies() {
  GetIt.I.registerSingleton<String>(
    "https://online.abn.kg/ords/abn/",
    instanceName: 'baseUrl',
  );

  injectDio();
  injectBlocs();
}

void injectBlocs() {
  GetIt.I.registerSingleton<HomeCubit>(HomeCubit());
}

void injectDio({BaseOptions? dioOptions}) {

  var options = dioOptions ??
      BaseOptions(
        baseUrl: GetIt.I.get<String>(instanceName: 'baseUrl'),
      );

  final dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      return handler.next(options);
    },
  ));

  GetIt.I.registerSingleton<Dio>(Dio(options));
}
