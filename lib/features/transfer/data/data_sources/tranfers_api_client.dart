import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tranfers_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class TransfersApiClient{
  factory TransfersApiClient(Dio dio, { String baseUrl}) = _TransfersApiClient;


    @POST(
    "/accounts/transfer",
  )
   @FormUrlEncoded()
  Future<HttpResponse> transfer(
  { @Field("phoneNumber") required String phoneNumber,
    @Field("amount") required int amount,}
  );

}
