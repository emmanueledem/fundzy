import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'withdraw_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class WithDrawApiClient {
  factory WithDrawApiClient(Dio dio, {String baseUrl}) = _WithDrawApiClient;

  @POST(
    "/accounts/withdraw",
  )
  @FormUrlEncoded()
  Future<HttpResponse> withdraw({
    @Field("phoneNumber") required String phoneNumber,
    @Field("amount") required int amount,
  });

}
