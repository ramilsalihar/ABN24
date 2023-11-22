import 'package:flutter/material.dart';

class RegisterField extends StatefulWidget {
  const RegisterField({
    super.key,
    required this.hintText,
    required this.borderColor,
    required this.keyboardType,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.trailingIcon = false,
    this.validateMode = false,
    this.onCompleted,
  });

  final String hintText;
  final Color borderColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool trailingIcon;
  final TextEditingController controller;
  final bool validateMode;
  final VoidCallback? onCompleted;

  @override
  State<RegisterField> createState() => _RegisterFieldState();
}

class _RegisterFieldState extends State<RegisterField> {
  bool showPassword = false;

  @override
  void initState() {
    widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleShowPassword() {
      setState(() {
        showPassword = !showPassword;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        scrollPadding: const EdgeInsets.all(10),
        autovalidateMode:
            widget.validateMode ? AutovalidateMode.onUserInteraction : null,
        maxLines: 1,
        obscureText: widget.obscureText && !showPassword,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[600]),
            hintText: widget.hintText,
            fillColor: Colors.white,
            suffixIcon: widget.trailingIcon
                ? IconButton(
                    onPressed: toggleShowPassword,
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : const SizedBox(),
            semanticCounterText:
                showPassword ? 'show password' : 'hide password',
            errorMaxLines: 2),

        onEditingComplete:widget.onCompleted,
      ),
    );
  }
}
