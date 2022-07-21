// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as i9;
import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as i10;
import 'package:shared_preferences/shared_preferences.dart' as i14;

import 'app/view/widgets/app_popup_loader.dart' as i3;
import 'core/local_data_storage/local_data_storage.dart' as i11;
import 'core/network/network_info.dart' as i13;
import 'core/utils/custom_form_validation.dart' as i8;
import 'features/auth/auth.dart' as i5;
import 'features/auth/data/datasources/auth_remote_data_sources.dart' as i22;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as i7;
import 'features/auth/domain/repositories/auth_repository.dart' as i6;
import 'features/auth/domain/usecases/login_usecase.dart' as i12;
import 'features/auth/domain/usecases/signup_usecases.dart' as i15;
import 'features/auth/presentation/provider/auth_provider.dart' as i4;
import 'features/features.dart' as i17;
import 'features/home/data/datasources/transaction_remote_data_source.dart'
    as i18;
import 'features/home/data/repository/transaction_repository_implementation.dart'
    as i20;
import 'features/home/domain/usecases/transaction_usecase.dart' as i21;
import 'features/home/home.dart' as i19;
import 'features/home/presentation/provider/transaction_provider.dart' as i16;
import 'register_module.dart' as i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
i1.GetIt $initGetIt(i1.GetIt get,
    {String? environment, i2.EnvironmentFilter? environmentFilter}) {
  final gh = i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<i3.AppPopups>(() => i3.AppPopups());
  gh.lazySingleton<i4.AuthProvider>(() => i4.AuthProvider(
      signUpUseCase: get<i5.SignUpUseCase>(),
      loginUseCase: get<i5.LoginUseCase>()));
  gh.lazySingleton<i6.AuthRepository>(
      () => i7.AuthRepositpryImpl(get<i5.AuthRemoteDataSource>()));
  gh.lazySingleton<i8.CustomFormValidation>(() => i8.CustomFormValidation());
  gh.factory<i9.Dio>(() => registerModule.dio);
  gh.factory<i10.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<i11.LocalDataStorage>(() => i11.LocalDataStorageImpl());
  gh.lazySingleton<i12.LoginUseCase>(
      () => i12.LoginUseCase(authRepository: get<i6.AuthRepository>()));
  gh.lazySingleton<i13.NetworkInfo>(
      () => i13.NetworkInfoImpl(get<i10.InternetConnectionChecker>()));
  gh.factoryAsync<i14.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<i15.SignUpUseCase>(
      () => i15.SignUpUseCase(authRepository: get<i6.AuthRepository>()));
  gh.lazySingleton<i16.TransactionProvider>(() => i16.TransactionProvider(
      transactionUseCase: get<i17.TransactionUseCase>()));
  gh.lazySingleton<i18.TransactionRemoteDataSource>(() =>
      i18.TransactionRemoteDataSourceImpl(
          networkInfo: get<i13.NetworkInfo>(), dio: get<i9.Dio>()));
  gh.lazySingleton<i19.TransactionRepository>(() =>
      i20.TransactionRepositpryImpl(get<i19.TransactionRemoteDataSource>()));
  gh.lazySingleton<i21.TransactionUseCase>(() =>
      i21.TransactionUseCase(authRepository: get<i19.TransactionRepository>()));
  gh.lazySingleton<i22.AuthRemoteDataSource>(() => i22.AuthRemoteDataSourceImpl(
      networkInfo: get<i13.NetworkInfo>(), dio: get<i9.Dio>()));
  return get;
}

class _$RegisterModule extends i23.RegisterModule {}
