import 'package:fundzy/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/home/domain/entities/account_entities.dart';
import 'package:fundzy/features/home/domain/repositories/account_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class AllAccountUseCase extends UseCase<List<AllAccountEntity> , NoParams> {
  AllAccountUseCase({required this.allAccountRepository });
  late final AllAccountRepository allAccountRepository;
  @override
  Future<Either<Failure, List<AllAccountEntity>>> call(NoParams params) async {
    return await allAccountRepository.allAccounts();
  }

}