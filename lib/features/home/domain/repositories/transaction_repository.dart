import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/home/home.dart';

abstract class TransactionRepository{
  Future<Either<Failure, List<TransactionEntity>>> transactionRepository();
}