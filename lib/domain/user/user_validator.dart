import 'package:equatable/equatable.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class UserFormValidator extends Equatable {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "Email field can not be blank";
    }

    final isValid = EmailValidator.validate(email);
    if (!isValid || email.contains('email')) {
      return "Please enter a valid email adress";
    }

    return null;
  }

  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "Your full Name is required";
    }

    if (!RegExp("[A-Za-z] [A-Za-z]").hasMatch(fullName)) {
      return "Please enter a valid name";
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "Password field can not be blank";
    }
    if (password.trim().length < 5) {
      return "Password length must be 5 characters and up";
    }

    return null;
  }

  static String? validateUserName(String? userName) {
    if (RegExp("[A-Z]").hasMatch(userName!)) {
      return "Upper case letters are not permitted in a user name";
    }
    if (userName.trim().isEmpty) {
      return "User name field can not be blank";
    }

    return null;
  }

  @override
  List<Object?> get props => [];
}
