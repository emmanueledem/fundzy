// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'app/view/widgets/app_popup_loader.dart' as _i3;
import 'core/local_data_storage/local_data_storage.dart' as _i11;
import 'core/network/network_info.dart' as _i13;
import 'core/utils/custom_form_validation.dart' as _i8;
import 'features/auth/auth.dart' as _i5;
import 'features/auth/data/datasources/auth_remote_data_sources.dart' as _i26;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as _i7;
import 'features/auth/domain/repositories/auth_repository.dart' as _i6;
import 'features/auth/domain/usecases/login_usecase.dart' as _i12;
import 'features/auth/domain/usecases/signup_usecases.dart' as _i15;
import 'features/auth/presentation/provider/auth_provider.dart' as _i4;
import 'features/features.dart' as _i17;
import 'features/home/data/datasources/transaction_remote_data_source.dart'
    as _i18;
import 'features/home/data/repository/transaction_repository_implementation.dart'
    as _i20;
import 'features/home/domain/usecases/transaction_usecase.dart' as _i21;
import 'features/home/home.dart' as _i19;
import 'features/home/presentation/provider/transaction_provider.dart' as _i16;
import 'features/transfer/data/data_sources/transfer_remote_data_sources.dart'
    as _i23;
import 'features/transfer/data/repositories/transfer_repositries_implementation.dart'
    as _i24;
import 'features/transfer/domain/usecase/transfer_usecase.dart' as _i25;
import 'features/transfer/presentation/provider/transfer_provider.dart' as _i22;
import 'register_module.dart' as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.CustomFormValidation>(() => _i8.CustomFormValidation());
  gh.factory<_i9.Dio>(() => registerModule.dio);
  gh.factory<_i10.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i11.LocalDataStorage>(() => _i11.LocalDataStorageImpl());
  gh.lazySingleton<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(authRepository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i13.NetworkInfoImpl(get<_i10.InternetConnectionChecker>()));
  gh.factoryAsync<_i14.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<_i15.SignUpUseCase>(
      () => _i15.SignUpUseCase(authRepository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i16.TransactionProvider>(() => _i16.TransactionProvider(
      transactionUseCase: get<_i17.TransactionUseCase>()));
  gh.lazySingleton<_i18.TransactionRemoteDataSource>(() =>
      _i18.TransactionRemoteDataSourceImpl(
          networkInfo: get<_i13.NetworkInfo>(), dio: get<_i9.Dio>()));
  gh.lazySingleton<_i19.TransactionRepository>(() =>
      _i20.TransactionRepositpryImpl(get<_i19.TransactionRemoteDataSource>()));
  gh.lazySingleton<_i21.TransactionUseCase>(() => _i21.TransactionUseCase(
      authRepository: get<_i19.TransactionRepository>()));
  gh.lazySingleton<_i22.TransferProvider>(() =>
      _i22.TransferProvider(transferUsecase: get<_i17.TransferUsecase>()));
  gh.lazySingleton<_i23.TransferRemoteDataSource>(() =>
      _i23.TransferRemoteDataSourceImpl(
          networkInfo: get<_i13.NetworkInfo>(), dio: get<_i9.Dio>()));
  gh.lazySingleton<_i17.TransferRepositry>(
      () => _i24.TransferRepositoryImpl(get<_i17.TransferRemoteDataSource>()));
  gh.lazySingleton<_i25.TransferUsecase>(() =>
      _i25.TransferUsecase(transferRepositry: get<_i17.TransferRepositry>()));
  gh.lazySingleton<_i26.AuthRemoteDataSource>(() =>
      _i26.AuthRemoteDataSourceImpl(
          networkInfo: get<_i13.NetworkInfo>(), dio: get<_i9.Dio>()));
  return get;
}

class _$RegisterModule extends _i27.RegisterModule {}
