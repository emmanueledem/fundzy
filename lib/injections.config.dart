// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'core/network/network_info.dart' as _i9;
import 'features/auth/auth.dart' as _i5;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as _i4;
import 'features/auth/domain/repositories/auth_repository.dart' as _i3;
import 'features/auth/domain/usecases/login_usecase.dart' as _i8;
import 'features/auth/domain/usecases/signup_usecases.dart' as _i11;
import 'register_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthRepository>(
      () => _i4.AuthRepositpryImpl(get<_i5.AuthRemoteDataSource>()));
  gh.factory<_i6.Dio>(() => registerModule.dio);
  gh.factory<_i7.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i8.LoginUseCase>(
      () => _i8.LoginUseCase(authRepository: get<_i3.AuthRepository>()));
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i9.NetworkInfoImpl(get<_i7.InternetConnectionChecker>()));
  gh.factoryAsync<_i10.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<_i11.SignUpUseCase>(
      () => _i11.SignUpUseCase(authRepository: get<_i3.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
