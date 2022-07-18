import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class FlushBarNotification {
  static dynamic showErrorMessage({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(
      seconds: 4,
    ),
  }) {
    return Flushbar(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
      backgroundGradient: LinearGradient(
        colors: [Colors.red.shade400, Colors.redAccent.shade100],
        stops: const [0.6, 1],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: const Icon(
        Icons.warning,
        size: 28.0,
        color: Colors.white,
      ),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'Error',
      message: message,
      duration: duration,
    )..show(context);
  }

  static dynamic showSuccessMessage({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(
      seconds: 4,
    ),
  }) {
    /*return FlushbarHelper.createSuccess(
      message: message,
      title: 'Success',
      duration: duration,
    )..show(context);*/
    return Flushbar(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: const [0.6, 1],
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'Success',
      message: message,
      duration: duration,
    )..show(context);
  }

  static dynamic showInfoMessage({
    required BuildContext context,
    String title = 'Information',
    required String message,
    Duration duration = const Duration(
      seconds: 4,
    ),
  }) {
    return FlushbarHelper.createInformation(
      message: message,
      title: 'Success',
      duration: duration,
    )..show(context);
  }
}
