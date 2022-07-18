import 'package:flutter/cupertino.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/auth/auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.signUpUseCase, required this.loginUseCase});

  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  AuthEntity? authEntity;

  Future<void> signUp(
    BuildContext context, {
    required String phoneNumber,
    required String password,
  }) async {
    final navigator = Navigator.of(context);
    final result = await signUpUseCase(
        SignUpParams(phoneNumber: phoneNumber, password: password));
    navigator.pop();
    result.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) async {
        authEntity = r;
        notifyListeners();
      },
    );
  }

  Future<void> login(
    BuildContext context, {
    required String phoneNumber,
    required String password,
  }) async {
    final navigator = Navigator.of(context);
    final result = await loginUseCase(
        LoginParams(phoneNumber: phoneNumber, password: password));
    navigator.pop();
    result.fold((l) {
      FlushBarNotification.showErrorMessage(
        context: context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
    }, (r) async {
      authEntity = r;
      notifyListeners();
    });
  }
}
