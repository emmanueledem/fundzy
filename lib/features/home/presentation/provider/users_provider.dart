import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fundzy/app/app.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/home/domain/domain.dart';
import 'package:fundzy/features/home/domain/usecases/users_usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AllUsersProvider extends ChangeNotifier {
  AllUsersProvider({required this.allUsersUseCase});

  late AllUsersUseCase allUsersUseCase;
  List<AllUsersEntity>? allUsersEntity;
  bool? isComplete = false;

  Future<void> alluserHandler(BuildContext context, loader) async {
    final navigator = Navigator.of(context);
    if (!loader) {
      unawaited(AppPopups.showLoader(context));
    }
    final result = await allUsersUseCase(NoParams());
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
        allUsersEntity = r;
        isComplete = true;
        notifyListeners();
        return true;
      },
    );
  }
}
