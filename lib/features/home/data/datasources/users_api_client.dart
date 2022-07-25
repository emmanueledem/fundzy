import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class AllUsersApiClient {
  factory AllUsersApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AllUsersApiClient;

  @GET("/auth/users")
  Future<HttpResponse> allUsers();
}
