import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/home/domain/domain.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AllAccountProvider extends ChangeNotifier {
  AllAccountProvider({required this.allAccountUseCase});

  late AllAccountUseCase allAccountUseCase;
  List<AllAccountEntity>? allAccountEntity;
  bool? isComplete = false;

  Future<void> allaccountsHandler(BuildContext context, loader) async {
    final navigator = Navigator.of(context);
    if (!loader) {
      unawaited(AppPopups.showLoader(context));
    }
    final result = await allAccountUseCase(NoParams());
    if (!loader) {
      navigator.pop();
    }
    result.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        return false;
      },
      (r) async {
        allAccountEntity = r;
        isComplete = true;
        notifyListeners();
        return true;
      },
    );
  }
}
