import 'package:flutter/cupertino.dart';
import 'package:project_name/core/extensions/i10n_context.dart';

class FormValidation {
  final BuildContext context;

  FormValidation(this.context);

  String? validateInn(String? value){
    if (value == null || value.isEmpty) {
      return context.i10n.please_enter_inn;
    }

    final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericValue.length != 14) {
      return context.i10n.value_consist_14_digits;
    }

    if (!numericValue.startsWith(RegExp(r'[1-2]'))) {
      return context.i10n.value_starts_with_1_2;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return context.i10n.please_enter_password;
    }

    if (value.length < 6) {
      return context.i10n.password_consist_of_more_than_6;
    }

    // if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])').hasMatch(value)) {
    //   return context.i10n.password_consist_digits_and_letters;
    // }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return context.i10n.please_enter_phone_number;
    }

    final numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericValue.length != 12) {
      return context.i10n.telephone_consist_12_digits;
    }

    if (!numericValue.startsWith('996')) {
      return context.i10n.telephone_number_should_start;
    }

    return null;
  }

  String? validatePasswordConfirmation(String? password, String? confirmPassword) {
    if (password == null || password.isEmpty || confirmPassword == null || confirmPassword.isEmpty) {
      return context.i10n.please_enter_both_password;
    }

    if (password != confirmPassword) {
      return context.i10n.passwords_dont_match;
    }

    return null;
  }

  String? validateCyrillic(String? value) {
    if (value == null || value.isEmpty) {
      return context.i10n.please_fill_the_form;
    }

    if (!RegExp(r'^[а-яА-Я]+$').hasMatch(value)) {
      return context.i10n.form_should_contain_cyrillic_letters;
    }

    return null;
  }
}