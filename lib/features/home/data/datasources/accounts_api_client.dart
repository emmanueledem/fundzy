import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

 part 'accounts_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class AccoutApiClient{
  factory AccoutApiClient(
    Dio dio, {
      String baseUrl,
  }) = _AccoutApiClient;

@GET("/accounts/list")
Future<HttpResponse> allAccount();

}