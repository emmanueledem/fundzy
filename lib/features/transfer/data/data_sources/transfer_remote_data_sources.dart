import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/network/network_info.dart';
import 'package:fundzy/features/features.dart';
import 'package:injectable/injectable.dart';

abstract class TransferRemoteDataSource {
  Future<TransferModel> transfers(
      {required String phoneNumber, required int amount});
}

@LazySingleton(as: TransferRemoteDataSource)
class TransferRemoteDataSourceImpl implements TransferRemoteDataSource {
  TransferRemoteDataSourceImpl({required this.networkInfo, required this.dio})
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
    client = TransfersApiClient(dio);
  }

  final NetworkInfo networkInfo;
  final Dio dio;
  late final TransfersApiClient client;

  @override
  Future<TransferModel> transfers(
      {required String phoneNumber, required int amount}) async {
  if(await networkInfo.isConnected){
      final respone =  await client.transfer(phoneNumber: phoneNumber, amount: amount);
  return TransferModel.fromJson(respone.response.data as Map<String, dynamic>);
  }else{
    throw NoInternetException();
    }
  }
}
