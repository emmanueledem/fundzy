import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/usecase/usecase.dart';
import 'package:fundzy/features/auth/auth.dart';
import 'package:fundzy/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignUpUseCase extends UseCase<AuthEntity, SignUpParams> {
  SignUpUseCase({required this.authRepository});

  late final AuthRepository authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(SignUpParams params) async {
    return await authRepository.signUp(
        phoneNumber: params.phoneNumber, password: params.password);
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({ required this.phoneNumber, required this.password,});

  final String phoneNumber;
  final String password;
  
  @override
  List<Object?> get props => [
    phoneNumber,
    password,
  ];
}
