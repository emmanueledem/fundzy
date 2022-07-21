import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'transaction_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class TransactionApiClient {
  factory TransactionApiClient(
    Dio dio, {
    String baseUrl,
  }) = _TransactionApiClient;

  @GET("/transactions")
  Future<HttpResponse> allTransaction();
}
