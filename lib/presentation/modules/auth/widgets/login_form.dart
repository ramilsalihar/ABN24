import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/mixins/dialog_helper.dart';
import 'package:project_name/presentation/core/validation/form_validation.dart';
import 'package:project_name/presentation/core/widgets/buttons/register_button.dart';
import 'package:project_name/presentation/core/widgets/register_field.dart';
import 'package:project_name/presentation/routes/app_router.gr.dart';

import '../../info/info_cubit/info_cubit.dart';
import '../auth_cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

GlobalKey<FormState> loginKey = GlobalKey();

class _LoginFormState extends State<LoginForm> with DialogHelper {
  final _innController = TextEditingController();
  final _passwordController = TextEditingController();
  final _smsCodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordRepeatController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<InfoCubit>(context).getCreditInfo();
    });
    super.initState();
  }

  @override
  void dispose() {
    _innController.dispose();
    _passwordController.dispose();
    _smsCodeController.dispose();
    _phoneNumberController.dispose();
    _newPasswordController.dispose();
    _newPasswordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginKey,
      child: BlocConsumer<AuthCubit, AuthData>(
        listener: _authBlocListener,
        builder: (context, state) {
          if (state.authState is LogInState) {
            return _login(context);
          } else if (state.authState is ForgetPasswordState) {
            return _forgotPassword(context);
          } else if (state.authState is SubmitPhoneNumberState) {
            return _confirmSMS(context);
          } else if (state.authState is ConfirmSmsState) {
            return _updatePassword(context);
          }
          return _login(context);
        },
      ),
    );
  }

  void _authBlocListener(BuildContext context, AuthData state) {
    var eState = state.authState;
    if (eState is LoginLoadingState) {
      EasyLoading.show(status: context.i10n.loading);
    } else {
      EasyLoading.dismiss();
    }

    if (eState is LoginSuccessState) {
      context.router.replace(const HomeRoute());
    } else if (eState is LoginFailureState) {
      showMessageDialog(
        context: context,
        message: eState.message,
      );
    }
  }

  Widget _login(BuildContext context) {
    final formValidation = FormValidation(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.i10n.authorization,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.green),
        ).padding(
          EdgeInsets.only(left: context.dimens.paddingSmall),
        ),
        RegisterField(
          hintText: context.i10n.enter_inn,
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          validator: (_) => formValidation.validateInn(
            _innController.text,
          ),
          controller: _innController,
        ),
        RegisterField(
          hintText: context.i10n.password,
          borderColor: Colors.grey,
          keyboardType: TextInputType.text,
          controller: _passwordController,
          validator: (_) => formValidation.validatePassword(
            _passwordController.text,
          ),
          obscureText: true,
          trailingIcon: true,
        ),
        RegisterButton(
            title: context.i10n.enter,
            onTap: () {
              if (loginKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).login(
                  context,
                  _innController.text,
                  _passwordController.text,
                );
              }
            }),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () =>
                  BlocProvider.of<AuthCubit>(context).forgotPassword(),
              child: Text(
                context.i10n.recover_password,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
              )),
        ),
      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    final formValidation = FormValidation(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.i10n.recover_of_password,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.green,
                ),
          ).padding(
            EdgeInsets.only(left: context.dimens.paddingSmall),
          ),
        ),
        RegisterField(
          hintText: '+996',
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          controller: _phoneNumberController,
          validator: (_) => formValidation.validatePhoneNumber(
            _phoneNumberController.text,
          ),
        ),
        RegisterButton(
            title: context.i10n.get_sms_password,
            onTap: () {
              if (loginKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).submitPhoneNumber(
                  _phoneNumberController.text,
                );
              }
            })
      ],
    );
  }

  Widget _confirmSMS(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.i10n.new_password,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.green,
                ),
          ).padding(
            EdgeInsets.only(left: context.dimens.paddingSmall),
          ),
        ),
        RegisterField(
          hintText: context.i10n.code,
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          controller: _smsCodeController,
        ),
        RegisterButton(
            title: context.i10n.confirm,
            onTap: () {
              if (loginKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).confirmSMS(
                  _smsCodeController.text,
                );
              }
            }),
      ],
    );
  }

  Widget _updatePassword(BuildContext context) {
    final formValidation = FormValidation(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.i10n.authorization,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.green,
                  ),
            ).padding(
              EdgeInsets.only(left: context.dimens.paddingSmall),
            )),
        RegisterField(
          hintText: context.i10n.enter_inn,
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          controller: _innController,
          validator: (_) => formValidation.validateInn(
            _innController.text,
          ),
        ),
        RegisterField(
          hintText: context.i10n.new_password,
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          controller: _newPasswordController,
          validator: (_) => formValidation.validatePassword(
            _newPasswordController.text,
          )!,
        ),
        RegisterField(
          hintText: context.i10n.repeat_password,
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          controller: _newPasswordRepeatController,
          validator: (_) => formValidation.validatePasswordConfirmation(
            _newPasswordController.text,
            _newPasswordRepeatController.text,
          )!,
        ),
        RegisterButton(
            title: context.i10n.confirm,
            onTap: () {
              if (loginKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).updatePassword();
              }
            })
      ],
    );
  }
}
