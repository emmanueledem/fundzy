import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: "https://bank.veegil.com")
abstract class AuthApiClient {
  factory AuthApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiClient;

  
  @POST(
    "/auth/signup",
  )
   @FormUrlEncoded()
  Future<HttpResponse> signUp(
  { @Field("phoneNumber") required String phoneNumber,
    @Field("password") required String password,}
  );

  @POST(
    "/auth/login",
  )
   @FormUrlEncoded()
  Future<HttpResponse> login(
       { @Field("phoneNumber") required String phoneNumber,
    @Field("password") required String password,}
     );
}
