import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fundzy/app/view/view.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class TransferProvider extends ChangeNotifier {
  TransferProvider({required this.transferUsecase});

  final TransferUsecase transferUsecase;
  TransferEntity? transferEntity;

  Future<bool> transfer(BuildContext context,
      {required String phoneNumber, required int amount}) async {
    final navigator = Navigator.of(context);
    unawaited(AppPopups.showLoader(context));
    final result = await transferUsecase(
        TransferParams(phoneNumber: phoneNumber, amount: amount));
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
        transferEntity = r;
        // FlushBarNotification.showSuccessMessage(
        //     context: context, message: r.message.toString());
        notifyListeners();
        return true;
      },
    );
  }
}
