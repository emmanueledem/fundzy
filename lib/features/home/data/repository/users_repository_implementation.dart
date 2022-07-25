import 'package:dio/dio.dart';
import 'package:fundzy/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:fundzy/features/home/data/data.dart';
import 'package:fundzy/features/home/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';


@LazySingleton(as: AllUsersRepository)
class AlluserRepositoryImpl extends AllUsersRepository {
  AlluserRepositoryImpl({required this.allUsersRemoteDataSource});

  final AllUsersRemoteDataSource allUsersRemoteDataSource;

  @override
  Future<Either<Failure, List<AllUsersList>>> allUsers() async {
    try {
      final response = await allUsersRemoteDataSource.allUsers();
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
