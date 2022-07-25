import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:fundzy/core/core.dart';
import 'package:fundzy/core/network/network_info.dart';
import 'package:fundzy/features/home/data/data.dart';
import 'package:injectable/injectable.dart';

abstract class AllUsersRemoteDataSource {
  Future<List<AllUsersList>> allUsers();
}

@LazySingleton(as: AllUsersRemoteDataSource)
class AllUsersRemoteDataSourceImpl implements AllUsersRemoteDataSource {
  AllUsersRemoteDataSourceImpl({required this.dio, required this.networkInfo})
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
    client = AllUsersApiClient(dio);
  }

  final NetworkInfo networkInfo;
  final Dio dio;
  late final AllUsersApiClient client;

  @override
  Future<List<AllUsersList>> allUsers() async {
    if (await networkInfo.isConnected) {
      final response = await client.allUsers();
      return AllUsersModel.fromJson(
              (response.response.data as Map<String, dynamic>))
          .data;
    } else {
      throw NoInternetException();
    }
  }
}
