import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
   Future<SharedPreferences> get prefs => SharedPreferences.getInstance(); 
      InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

}
