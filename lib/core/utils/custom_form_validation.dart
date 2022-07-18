import 'package:flutter/material.dart';
import 'package:fundzy/core/constant/colors.dart';


class CustomFormValidation {
  static Color getColor(
    String? text,
    FocusNode focus,
    String? validationError,
  ) {
    if (focus.hasFocus && text == null) {
      return AppColors.red;
    } else if (focus.hasFocus &&
        text!.isEmpty &&
        validationError != null &&
        validationError.isNotEmpty) {
      return AppColors.red;
    } else if (focus.hasFocus &&
        text!.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor;
    } else if (text != null &&
        text.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor;
    } else if (validationError != null && validationError.isNotEmpty) {
      return AppColors.red;
    } else {
      return AppColors.primaryColor;
    }
  }

  static String errorMessage(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  static String errorMessagePassword(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length < 5) {
      return 'Password must have 5 or more characters';
    } else {
      return '';
    }
  }

  static String errorMessageSPC(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 10) {
      return 'Invalid POS Owner ID';
    } else {
      return '';
    }
  }

  static String errorMessageRRR(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 12) {
      return 'Invalid RRR';
    } else {
      return '';
    }
  }
}
