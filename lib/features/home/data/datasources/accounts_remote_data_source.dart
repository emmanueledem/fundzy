import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fundzy/core/errors/error.dart';
import 'package:fundzy/core/network/network_info.dart';
import 'package:fundzy/features/home/data/data.dart';
import 'package:injectable/injectable.dart';

abstract class AllAccountRemoteDataSource {
  Future<List<AllAccountList>> allAccount();
}

@LazySingleton(as: AllAccountRemoteDataSource)
class AllAccountRemoteDataSourceImpl implements AllAccountRemoteDataSource{
    AllAccountRemoteDataSourceImpl({required this.dio, required this.networkInfo}):super()  {
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
    client = AccoutApiClient(dio);
  }
    
  final NetworkInfo networkInfo;
  final Dio dio;
  late final AccoutApiClient client;
  
  @override
  Future<List<AllAccountList>> allAccount() async {

      if(await networkInfo.isConnected){
        final response  =  await client.allAccount();
          return AllAccountModel.fromJson(response.response.data as Map<String, dynamic>).data;
              }else{
throw NoInternetException();
      }
    
  }





}

