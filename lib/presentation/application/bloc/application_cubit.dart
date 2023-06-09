import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationInitial());
}
