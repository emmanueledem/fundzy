import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/withdraw/domain/domain.dart';

abstract class WithdrawRepository {
  Future<Either<Failure, WithdrawalEntity>> withdraw({required String phoneNumber, required int amount}  );
}
