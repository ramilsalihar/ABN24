import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/mixins/dialog_helper.dart';
import 'package:project_name/presentation/core/validation/form_validation.dart';
import 'package:project_name/presentation/core/widgets/buttons/register_button.dart';
import 'package:project_name/presentation/core/widgets/custom_checkboxtile.dart';
import 'package:project_name/presentation/core/widgets/register_field.dart';

import '../../../routes/app_router.gr.dart';
import '../auth_cubit/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

final GlobalKey<FormState> signupKey = GlobalKey();

class _SignupFormState extends State<SignupForm> with DialogHelper {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupKey,
      child: BlocConsumer<AuthCubit, AuthData>(
        listener: _authBlocListener,
        builder: (context, state) {
          if (state.authState is SignUpState) {
            return _submitPhoneNumber(context);
          } else if (state.authState is SubmitPhoneNumberState) {
            return _confirmSms(context);
          } else if (state.authState is ConfirmSmsState) {
            return _signUp(context);
          }
          return _signUp(context);
        },
      ),
    );
  }

  void _authBlocListener(BuildContext context, AuthData state) {
    var eState = state.authState;
    if (eState is SignUpLoadingState) {
      EasyLoading.show(status: context.i10n.loading);
    } else {
      EasyLoading.dismiss();
    }

    if (eState is SignUpSuccessState) {
      context.router.replace(const HomeRoute());
    } else if (eState is SignUpFailureState) {
      showMessageDialog(
        context: context,
        message: eState.message,
      );
    }
  }
}

Widget _submitPhoneNumber(BuildContext context) {
  final phoneController = TextEditingController();
  final formValidation = FormValidation(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.i10n.registration,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.green,
              ),
        ).padding(
          EdgeInsets.only(
            left: context.dimens.paddingMedium,
          ),
        ),
      ),
      RegisterField(
        hintText: '+996',
        borderColor: Colors.grey,
        keyboardType: TextInputType.number,
        controller: phoneController,
        validator: (_) => formValidation.validatePhoneNumber(
          phoneController.text,
        ),
      ),
      RegisterButton(
          title: context.i10n.get_sms_password,
          onTap: () {
            if (signupKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).submitPhoneNumber(
                phoneController.text,
              );
            }
          }),
    ],
  );
}

Widget _confirmSms(BuildContext context) {
  final smsController = TextEditingController();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(context.i10n.registration,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.green,
                )).padding(
          EdgeInsets.only(
            left: context.dimens.paddingMedium,
          ),
        ),
      ),
      RegisterField(
        hintText: context.i10n.code,
        borderColor: Colors.grey,
        keyboardType: TextInputType.number,
        controller: smsController,
      ),
      RegisterButton(
          title: context.i10n.confirm,
          onTap: () {
            if (signupKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).confirmSMS(
                smsController.text,
              );
            }
          }),
    ],
  );
}

Widget _signUp(BuildContext context) {
  final formValidation = FormValidation(context);
  final innController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.i10n.registration,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colors.green,
              ),
        ).padding(
          EdgeInsets.only(
            left: context.dimens.paddingMedium,
          ),
        ),
      ),
      RegisterField(
        hintText: context.i10n.enter_inn,
        borderColor: Colors.grey,
        keyboardType: TextInputType.number,
        controller: innController,
        validator: (_) => formValidation.validateInn(
          innController.text,
        ),
      ),
      RegisterField(
        hintText: context.i10n.password,
        borderColor: Colors.grey,
        keyboardType: TextInputType.text,
        controller: passwordController,
        validator: (_) => formValidation.validatePassword(
          passwordController.text,
        ),
      ),
      RegisterField(
        hintText: context.i10n.repeat_password,
        borderColor: Colors.grey,
        keyboardType: TextInputType.text,
        controller: repeatPasswordController,
        validator: (_) => formValidation.validatePasswordConfirmation(
          passwordController.text,
          repeatPasswordController.text,
        )!,
      ),
      const CustomCheckboxTile(),
      RegisterButton(
        title: context.i10n.confirm,
        onTap: () {
          if (signupKey.currentState!.validate()) {
            BlocProvider.of<AuthCubit>(context).signUp(
              innController.text,
              passwordController.text,
              repeatPasswordController.text,
            );
          }
        },
      )
    ],
  );
}
