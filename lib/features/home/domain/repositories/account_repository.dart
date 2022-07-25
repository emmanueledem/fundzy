import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/home/domain/domain.dart';

abstract class AllAccountRepository {
  Future<Either<Failure, List<AllAccountEntity>>> allAccounts();
}
