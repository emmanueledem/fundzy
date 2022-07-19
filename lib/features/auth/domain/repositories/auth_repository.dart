import 'package:dartz/dartz.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/features/auth/domain/domain.dart';


abstract class AuthRepository{
  Future<Either<Failure, LoginEntity>>  login({
    required String phoneNumber,
    required String password,
   });


    Future<Either<Failure, AuthEntity>>  signUp({
    required String phoneNumber,
    required String password,
   });
}