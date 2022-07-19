import 'package:dio/dio.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositpryImpl implements AuthRepository {
  AuthRepositpryImpl(this.authRemoteDataSource);
  final AuthRemoteDataSource authRemoteDataSource;
  @override
  Future<Either<Failure, LoginModel>> login(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await authRemoteDataSource.login(
          phoneNumber: phoneNumber, password: password);
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

  @override
  Future<Either<Failure, Userauth>> signUp(
      {required String phoneNumber, required String password}) async {
    try {
      final response = await authRemoteDataSource.signUp(
          phoneNumber: phoneNumber, password: password);
      return Right(response);
    } catch (e) {
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
