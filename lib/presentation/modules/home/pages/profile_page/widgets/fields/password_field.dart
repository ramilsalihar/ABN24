import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import '../../../../../../core/validation/form_validation.dart';
import '../../../../../../core/widgets/register_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final repeatPasswordController = TextEditingController();
    final formValidation = FormValidation(context);
    bool light = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //TODO: add fingerprint
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(context.i10n.enter_with_fingerprint),
              Spacer(),
              Switch(
                  value: light,
                  onChanged: (bool value) {
                    light = value;
                  })
            ],
          ),
        ),
        RegisterField(
          hintText: context.i10n.old_password,
          borderColor: Colors.green,
          keyboardType: TextInputType.text,
          controller: oldPasswordController,
          obscureText: true,
          validator: (_) =>
              formValidation.validatePassword(oldPasswordController.text),
          trailingIcon: true,
        ),
        RegisterField(
          hintText: context.i10n.new_password,
          borderColor: Colors.green,
          keyboardType: TextInputType.text,
          controller: newPasswordController,
          validateMode: true,
          obscureText: true,
          trailingIcon: true,
          validator: (_) =>
              formValidation.validatePassword(newPasswordController.text),
        ),
        RegisterField(
          hintText: context.i10n.repeat_password,
          borderColor: Colors.green,
          keyboardType: TextInputType.text,
          controller: repeatPasswordController,
          validateMode: true,
          obscureText: true,
          trailingIcon: true,
          validator: (_) => formValidation.validatePasswordConfirmation(
              newPasswordController.text, repeatPasswordController.text),
        )
      ],
    );
  }
}
