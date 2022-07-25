import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fundzy/core/errors/failure.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WithDrawUseCase extends UseCase<WithdrawalEntity, WithdrawParams> {
  late final WithdrawRepository withdrawRepository;
  WithDrawUseCase({required this.withdrawRepository});
  @override
  Future<Either<Failure, WithdrawalEntity>> call(WithdrawParams params) {
    return withdrawRepository.withdraw(
        phoneNumber: params.phoneNumber, amount: params.amount);
  }
}

class WithdrawParams extends Equatable {
  const WithdrawParams({required this.phoneNumber, required this.amount});

  final String phoneNumber;
  final int amount;

  @override
  List<Object?> get props => [phoneNumber, amount];
}
