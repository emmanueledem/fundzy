import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/network/network_info.dart';
import 'package:fundzy/features/auth/data/datasources/auth_api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../auth.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(
      {required String phoneNumber, required String password});

  Future<Userauth> signUp(
      {required String phoneNumber, required String password});
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.networkInfo, required this.dio})
      : super() {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // retry count (optional)
        retryDelays: const [
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );
    client = AuthApiClient(dio);
  }

  final NetworkInfo networkInfo;
  final Dio dio;
  final LocalDataStorage _localDataStorage = LocalDataStorageImpl();
  late final AuthApiClient client;

  @override
  Future<Userauth> signUp(
      {required String phoneNumber, required String password}) async {
    if (await networkInfo.isConnected) {
      final response =
          await client.signUp(phoneNumber: phoneNumber, password: password);
      Logger().d(response.response);
      return Userauth.fromJson(
        response.response.data as Map<String, dynamic>,
      );
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<LoginModel> login(
      {required String phoneNumber, required String password}) async {
    if (await networkInfo.isConnected) {
      final response =
          await client.login(phoneNumber: phoneNumber, password: password);
      await _localDataStorage
          .saveToken(response.response.data["data"]["token"]);
      Logger().d(response.response.data["data"]["token"]);
      return LoginModel.fromJson(
        response.response.data as Map<String, dynamic>,
      );
    } else {
      throw NoInternetException();
    }
  }
}
