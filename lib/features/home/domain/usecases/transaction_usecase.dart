import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/home/home.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TransactionUseCase extends UseCase<List<TransactionEntity>, NoParams> {
  TransactionUseCase({required this.authRepository});

  late final TransactionRepository authRepository;

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(NoParams params) async {
    return await authRepository.transactionRepository();
  }
}
