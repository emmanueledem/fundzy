// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'core/network/network_info.dart' as _i7;
import 'features/auth/domain/repositories/auth_repository.dart' as _i6;
import 'features/auth/domain/usecases/login_usecase.dart' as _i5;
import 'features/auth/domain/usecases/signup_usecases.dart' as _i9;
import 'register_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.LoginUseCase>(
      () => _i5.LoginUseCase(authRepository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.factoryAsync<_i8.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<_i9.SignUpUseCase>(
      () => _i9.SignUpUseCase(authRepository: get<_i6.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
