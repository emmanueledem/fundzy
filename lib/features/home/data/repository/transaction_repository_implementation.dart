import 'package:dio/dio.dart';
import 'package:fundzy/core/errors/error.dart';
import 'package:fundzy/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/features/home/home.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositpryImpl extends TransactionRepository {
  TransactionRepositpryImpl(this.transactionRemoteDataSource);
  final TransactionRemoteDataSource transactionRemoteDataSource;

  @override
  Future<Either<Failure, List<TransactionList>>> transactionRepository() async {
    try {
      final response = await transactionRemoteDataSource.transaction();
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
