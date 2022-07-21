import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class TransactionProvider extends ChangeNotifier {
  TransactionProvider({required this.transactionUseCase});

  late TransactionUseCase transactionUseCase;
  List<TransactionEntity>? transactionEntity;
  bool? isComplete = false;

  Future<void> transactionHandler(BuildContext context) async {
    final navigator = Navigator.of(context);
    unawaited(AppPopups.showLoader(context));
    final result = await transactionUseCase(NoParams());
    navigator.pop();
    result.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        return false;
      },
      (r) async {
        transactionEntity = r;
        Logger().d(r);
        isComplete = true;
        notifyListeners();
        return true;
      },
    );
  }
}