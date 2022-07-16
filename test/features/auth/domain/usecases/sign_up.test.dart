// import 'package:dartz/dartz.dart';
// import 'package:fundzy/core/core.dart';
// import 'package:fundzy/features/auth/auth.dart';
// import 'package:fundzy/features/auth/domain/repositories/auth_repository.dart';
// import 'package:fundzy/features/auth/domain/usecases/login_usecase.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';

// class MockLoginRepository extends Mock implements AuthRepository {}

// @GenerateMocks([AuthRepository])
// void main() {
//   late MockLoginRepository mockLoginRepository;
//   late LoginUseCase usecase;
//   late AuthEntity authEntity;

//   setUp(() {
//     mockLoginRepository = MockLoginRepository();
//     usecase = LoginUseCase(authRepository: mockLoginRepository);
//     authEntity = AuthData(
//       created: '22/July/2022' as DateTime,
//       phoneNumber: '08000000',
//     ) as AuthEntity;
//   });

//   test('should return right if the request is success', () async {
//     when(mockLoginRepository
//         .login(
//             phoneNumber: authEntity.data!.created.toString(),
//             password: authEntity.data!.phoneNumber.toString())
//         .then((value) => Future.value(
//               const Left(
//                 ServerFailure(message: 'Server Failure'),
//               ),
//             )));
//     final result = usecase;
//     verify(mockLoginRepository.login(
//         phoneNumber: authEntity.data!.created.toString(),
//         password: authEntity.data!.phoneNumber.toString()));
//     expect(result, true);
//     verifyNoMoreInteractions(mockLoginRepository);
//   });
// }
