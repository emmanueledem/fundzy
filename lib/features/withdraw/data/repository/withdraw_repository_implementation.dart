import 'package:dio/dio.dart';
import 'package:fundzy/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: WithdrawRepository)
class WithdrawRepositoryImpl implements WithdrawRepository {
  WithdrawRepositoryImpl({required this.withDrawRemoteDataSource});

  final WithDrawRemoteDataSource withDrawRemoteDataSource;
  @override
  Future<Either<Failure, WithdrawalModel>> withdraw(
      {required String phoneNumber, required int amount}) async {
    try {
      Logger().d("Hello3");
      final response = await withDrawRemoteDataSource.withdraw(
          phoneNumber: phoneNumber, amount: amount);
      Logger().d(response);
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
