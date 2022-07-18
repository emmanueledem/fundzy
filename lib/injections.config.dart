// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'app/view/widgets/app_popup_loader.dart' as _i3;
import 'core/network/network_info.dart' as _i11;
import 'features/auth/auth.dart' as _i5;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as _i7;
import 'features/auth/domain/repositories/auth_repository.dart' as _i6;
import 'features/auth/domain/usecases/login_usecase.dart' as _i10;
import 'features/auth/domain/usecases/signup_usecases.dart' as _i13;
import 'features/auth/presentation/provider/auth_provider.dart' as _i4;
import 'register_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppPopups>(() => _i3.AppPopups());
  gh.lazySingleton<_i4.AuthProvider>(() => _i4.AuthProvider(
      signUpUseCase: get<_i5.SignUpUseCase>(),
      loginUseCase: get<_i5.LoginUseCase>()));
  gh.lazySingleton<_i6.AuthRepository>(
      () => _i7.AuthRepositpryImpl(get<_i5.AuthRemoteDataSource>()));
  gh.factory<_i8.Dio>(() => registerModule.dio);
  gh.factory<_i9.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i10.LoginUseCase>(
      () => _i10.LoginUseCase(authRepository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i11.NetworkInfoImpl(get<_i9.InternetConnectionChecker>()));
  gh.factoryAsync<_i12.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<_i13.SignUpUseCase>(
      () => _i13.SignUpUseCase(authRepository: get<_i6.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
