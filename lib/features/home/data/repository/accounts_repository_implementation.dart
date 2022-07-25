import 'package:dio/dio.dart';
import 'package:fundzy/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/features/home/data/datasources/accounts_remote_data_source.dart';
import 'package:fundzy/features/home/data/model/accounts_model.dart';
import 'package:fundzy/features/home/domain/repositories/account_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AllAccountRepository)
class AllAccountRepositoryImpl implements AllAccountRepository {
  AllAccountRepositoryImpl({required this.allAccountRemoteDataSource});

  final AllAccountRemoteDataSource allAccountRemoteDataSource;

  @override
  Future<Either<Failure, List<AllAccountList>>> allAccounts() async {
    try {
      final response = await allAccountRemoteDataSource.allAccount();
      return Right(response);
    } catch (e) {
      Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }

      if (e is DioError) {
        Logger().e(e.response!.data);
        if (e.response!.data != null && e.response!.data != '') {
          return Left(
            ServerFailure(
              message: (e.response!.data as Map<String, dynamic>)['error']
                      as String? ??
                  (e.response!.data as Map<String, dynamic>)['message']
                      as String? ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      return const Left(ServerFailure(
        message: 'Server error, please try again',
      ));
    }
  }
}
