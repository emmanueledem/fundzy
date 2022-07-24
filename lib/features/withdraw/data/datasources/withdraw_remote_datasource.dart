import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/network/network_info.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class WithDrawRemoteDataSource {
  Future<WithdrawalModel> withdraw(
      {required String phoneNumber, required int amount});
}

@LazySingleton(as: WithDrawRemoteDataSource)
class WithDrawRemoteDataSourceImpl implements WithDrawRemoteDataSource {
  WithDrawRemoteDataSourceImpl({required this.networkInfo, required this.dio})
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
    client = WithDrawApiClient(dio);
  }

  final NetworkInfo networkInfo;
  final Dio dio;
  late final WithDrawApiClient client;

  @override
  Future<WithdrawalModel> withdraw(
      {required String phoneNumber, required int amount}) async {
    Logger().d("Hello4");
    if (await networkInfo.isConnected) {
      final response =
          await client.withdraw(phoneNumber: phoneNumber, amount: amount);
      Logger().d(response.response.data);
      return WithdrawalModel.fromJson(
          response.response.data as Map<String, dynamic>);
    } else {
      throw NoInternetException();
    }
  }
}
