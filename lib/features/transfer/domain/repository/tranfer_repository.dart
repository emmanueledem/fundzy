import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/transfer/domain/domain.dart';

abstract class TransferRepositry {
  Future<Either<Failure, TransferEntity>> transfer({required String phoneNumber,   required int  amount});
   
}
