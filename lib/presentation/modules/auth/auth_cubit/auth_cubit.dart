import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthData> {
  AuthCubit() : super(AuthData.initial());

  final _userService = UserService(GetIt.I.get<Dio>());

  // Login State
  Future<void> login(BuildContext ctx, String inn, String password) async {
    try {
      emit(
        AuthData(
          authMode: state.authMode,
          authState: LoginLoadingState(),
        ),
      );
      final response = await _userService.login(inn: inn, password: password);

      if (response.status == 0 && response.token != null) {
        GetIt.I.get<Dio>().options.headers.addAll({
          'token': response.token,
        });
        emit(
          AuthData(
            authMode: state.authMode,
            authState: LoginSuccessState(),
          ),
        );
      } else {
        emit(
          AuthData(
            authMode: state.authMode,
            authState: LoginFailureState(response.message ?? 'Ошибка'),
          ),
        );
      }
    } catch (e) {
      emit(
        AuthData(
          authMode: state.authMode,
          authState: LoginFailureState('Ошибка'),
        ),
      );
    }
  }

  Future<void> logout() async {
    try {
      emit(
        AuthData(
          authMode: state.authMode,
          authState: LogoutLoadingState(),
        ),
      );

      // Logout
      GetIt.I.get<Dio>().options.headers.remove('token');

      emit(
        AuthData(
          authMode: state.authMode,
          authState: LogoutSuccessState(),
        ),
      );
    } catch (e) {
      emit(
        AuthData(
          authMode: state.authMode,
          authState: LogoutFailureState('Ошибка'),
        ),
      );
    }
  }

  void forgotPassword() {
    emit(
      AuthData(
        authMode: state.authMode,
        authState: ForgetPasswordState(),
      ),
    );
  }

  void confirmSMS(String sms) {
    try {
      _userService.confirmSms(sms: sms);
      emit(
        AuthData(
          authMode: state.authMode,
          authState: ConfirmSmsState(),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  void updatePassword() {
    emit(
      AuthData(
        authMode: state.authMode,
        authState: UpdatePasswordState(),
      ),
    );
  }

  // Signup State
  Future<void> signUp(
    String inn,
    String password,
    String password_confirm,
  ) async {
    try {
      emit(
        AuthData(
          authMode: state.authMode,
          authState: SignUpLoadingState(),
        ),
      );
      final response = await _userService.signup(
        inn: inn,
        password: password,
        password_confirm: password_confirm,
      );

      emit(
        AuthData(
          authMode: state.authMode,
          authState: SignUpSuccessState(),
        ),
      );
    } catch (e) {
      print('error: $e');
      emit(
        AuthData(
          authMode: state.authMode,
          authState: SignUpFailureState(e.toString()),
        ),
      );
    }
  }

  void submitPhoneNumber(String phoneNumber) {
    try {
      _userService.registerPhoneNumber(phoneNumber: phoneNumber);

      emit(
        AuthData(
          authMode: state.authMode,
          authState: SubmitPhoneNumberState(),
        ),
      );
    } catch (e) {
      print('error: $e');
    }
  }

  void switchAuthMode() {
    if (state.authMode == AuthMode.login) {
      emit(
        AuthData(
          authMode: AuthMode.signup,
          authState: SignUpState(),
        ),
      );
    } else {
      emit(
        AuthData(
          authMode: AuthMode.login,
          authState: LogInState(),
        ),
      );
    }
  }
}
