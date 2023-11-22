part of 'auth_cubit.dart';

enum AuthMode { login, signup }

@immutable
class AuthData {
  late final AuthMode authMode;
  late final AuthState authState;

  AuthData({required this.authMode, required this.authState});

  AuthData.initial() {
    authMode = AuthMode.login;
    authState = AuthInitial();
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LogInState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  String message;

  LoginFailureState(this.message);
}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutFailureState extends AuthState {
  String message;

  LogoutFailureState(this.message);
}

class SignUpState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {
  String message;

  SignUpFailureState(this.message);
}

class ForgetPasswordState extends AuthState {}

class SubmitPhoneNumberState extends AuthState {}

class ConfirmSmsState extends AuthState {}

class UpdatePasswordState extends AuthState {}

class SwitchModeState extends AuthState {}
