import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class WithdrawProvider extends ChangeNotifier {
  WithdrawProvider({required this.withDrawUseCase});

  final WithDrawUseCase withDrawUseCase;
  WithdrawalEntity? withdrawalEntity;

  Future<bool> withdraw(BuildContext context,
      {required String phoneNumber, required int amount}) async {
      Logger().d("Hello1");
    final navigator = Navigator.of(context);
    unawaited(AppPopups.showLoader(context));
    final result = await withDrawUseCase(
        WithdrawParams(phoneNumber: phoneNumber, amount: amount));
    navigator.pop();
    return result.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        return false;
      },
      (r) async {
        withdrawalEntity = r;
        Logger().d(r);
        // FlushBarNotification.showSuccessMessage(
        //     context: context, message: r.message.toString());
        notifyListeners();
        return true;
      },
    );
  }
}
