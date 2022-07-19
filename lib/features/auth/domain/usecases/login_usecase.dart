import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/auth/auth.dart';
import 'package:fundzy/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase extends UseCase<AuthEntity, LoginParams> {
  LoginUseCase({required this.authRepository});

  late final AuthRepository authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParams params) async {
    return await   authRepository.signUp(
        phoneNumber: params.phoneNumber, password: params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.phoneNumber,
    required this.password,
  });

  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
      ];
}
