import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fundzy/core/errors/failure.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransferUsecase extends UseCase<TransferEntity, TransferParams> {
  TransferUsecase({required this.transferRepositry});
  late final TransferRepositry transferRepositry;
  @override
  Future<Either<Failure, TransferEntity>> call(TransferParams params) {
    return transferRepositry.transfer(
        phoneNumber: params.phoneNumber, amount: params.amount);
  }
}

class TransferParams extends Equatable {
  const TransferParams({required this.phoneNumber, required this.amount});

  final String phoneNumber;
  final int amount;

  @override
  List<Object?> get props => [phoneNumber, amount];
}
