import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
   
  part 'auth_api_client.g.dart';
 

@RestApi(baseUrl: "https://bank.veegil.com/")
abstract class AuthApiClient{
    factory   AuthApiClient(Dio dio, { 

      String baseUrl,
    }) = _AuthApiClient;



  @POST("/auth/signup",)
    Future<HttpResponse> signUp(
     { required String phoneNumber, required String password}
    );


  @POST("/auth/login",)
    Future<HttpResponse> login(
      { required String phoneNumber, required String password}
    );

}