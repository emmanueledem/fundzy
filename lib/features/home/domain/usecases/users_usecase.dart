import 'package:fundzy/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/home/domain/domain.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AllUsersUseCase extends UseCase<List<AllUsersEntity>, NoParams> {
  AllUsersUseCase({required this.allUsersRepository});
  late final AllUsersRepository allUsersRepository;
  @override
  Future<Either<Failure, List<AllUsersEntity>>> call(NoParams params) async {
    return await allUsersRepository.allUsers();
  }
}
