import 'package:get_it/get_it.dart';
import '../../presentation/modules/home/bloc/home_cubit.dart';

void injectAllDependencies() {
  injectBlocs();
}

void injectBlocs() {
  GetIt.I.registerSingleton<HomeCubit>(HomeCubit());
}
