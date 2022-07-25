// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import 'app/view/widgets/app_popup_loader.dart' as _i8;
import 'core/local_data_storage/local_data_storage.dart' as _i16;
import 'core/network/network_info.dart' as _i18;
import 'core/utils/custom_form_validation.dart' as _i13;
import 'features/auth/auth.dart' as _i10;
import 'features/auth/data/datasources/auth_remote_data_sources.dart' as _i40;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as _i12;
import 'features/auth/domain/repositories/auth_repository.dart' as _i11;
import 'features/auth/domain/usecases/login_usecase.dart' as _i17;
import 'features/auth/domain/usecases/signup_usecases.dart' as _i20;
import 'features/auth/presentation/provider/auth_provider.dart' as _i9;
import 'features/features.dart' as _i22;
import 'features/home/data/data.dart' as _i6;
import 'features/home/data/datasources/accounts_remote_data_source.dart'
    as _i34;
import 'features/home/data/datasources/transaction_remote_data_source.dart'
    as _i23;
import 'features/home/data/datasources/users_remote_data_source.dart' as _i39;
import 'features/home/data/repository/accounts_repository_implementation.dart'
    as _i36;
import 'features/home/data/repository/transaction_repository_implementation.dart'
    as _i25;
import 'features/home/data/repository/users_repository_implementation.dart'
    as _i5;
import 'features/home/domain/domain.dart' as _i4;
import 'features/home/domain/repositories/account_repository.dart' as _i35;
import 'features/home/domain/usecases/account_usecase.dart' as _i37;
import 'features/home/domain/usecases/transaction_usecase.dart' as _i26;
import 'features/home/domain/usecases/users_usecase.dart' as _i7;
import 'features/home/home.dart' as _i24;
import 'features/home/presentation/provider/account_provider.dart' as _i3;
import 'features/home/presentation/provider/transaction_provider.dart' as _i21;
import 'features/home/presentation/provider/users_provider.dart' as _i38;
import 'features/transfer/data/data_sources/transfer_remote_data_sources.dart'
    as _i28;
import 'features/transfer/data/repositories/transfer_repositries_implementation.dart'
    as _i29;
import 'features/transfer/domain/usecase/transfer_usecase.dart' as _i30;
import 'features/transfer/presentation/provider/transfer_provider.dart' as _i27;
import 'features/withdraw/data/datasources/withdraw_remote_datasource.dart'
    as _i31;
import 'features/withdraw/data/repository/withdraw_repository_implementation.dart'
    as _i33;
import 'features/withdraw/domain/usecases/withdraw_usecase.dart' as _i41;
import 'features/withdraw/presentation/provider/withdraw_provider.dart' as _i32;
import 'register_module.dart' as _i42; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AllAccountProvider>(() =>
      _i3.AllAccountProvider(allAccountUseCase: get<_i4.AllAccountUseCase>()));
  gh.lazySingleton<_i4.AllUsersRepository>(() => _i5.AlluserRepositoryImpl(
      allUsersRemoteDataSource: get<_i6.AllUsersRemoteDataSource>()));
  gh.lazySingleton<_i7.AllUsersUseCase>(() =>
      _i7.AllUsersUseCase(allUsersRepository: get<_i4.AllUsersRepository>()));
  gh.lazySingleton<_i8.AppPopups>(() => _i8.AppPopups());
  gh.lazySingleton<_i9.AuthProvider>(() => _i9.AuthProvider(
      signUpUseCase: get<_i10.SignUpUseCase>(),
      loginUseCase: get<_i10.LoginUseCase>()));
  gh.lazySingleton<_i11.AuthRepository>(
      () => _i12.AuthRepositpryImpl(get<_i10.AuthRemoteDataSource>()));
  gh.lazySingleton<_i13.CustomFormValidation>(
      () => _i13.CustomFormValidation());
  gh.factory<_i14.Dio>(() => registerModule.dio);
  gh.factory<_i15.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i16.LocalDataStorage>(() => _i16.LocalDataStorageImpl());
  gh.lazySingleton<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(authRepository: get<_i11.AuthRepository>()));
  gh.lazySingleton<_i18.NetworkInfo>(
      () => _i18.NetworkInfoImpl(get<_i15.InternetConnectionChecker>()));
  gh.factoryAsync<_i19.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<_i20.SignUpUseCase>(
      () => _i20.SignUpUseCase(authRepository: get<_i11.AuthRepository>()));
  gh.lazySingleton<_i21.TransactionProvider>(() => _i21.TransactionProvider(
      transactionUseCase: get<_i22.TransactionUseCase>()));
  gh.lazySingleton<_i23.TransactionRemoteDataSource>(() =>
      _i23.TransactionRemoteDataSourceImpl(
          networkInfo: get<_i18.NetworkInfo>(), dio: get<_i14.Dio>()));
  gh.lazySingleton<_i24.TransactionRepository>(() =>
      _i25.TransactionRepositpryImpl(get<_i24.TransactionRemoteDataSource>()));
  gh.lazySingleton<_i26.TransactionUseCase>(() => _i26.TransactionUseCase(
      authRepository: get<_i24.TransactionRepository>()));
  gh.lazySingleton<_i27.TransferProvider>(() =>
      _i27.TransferProvider(transferUsecase: get<_i22.TransferUsecase>()));
  gh.lazySingleton<_i28.TransferRemoteDataSource>(() =>
      _i28.TransferRemoteDataSourceImpl(
          networkInfo: get<_i18.NetworkInfo>(), dio: get<_i14.Dio>()));
  gh.lazySingleton<_i22.TransferRepositry>(
      () => _i29.TransferRepositoryImpl(get<_i22.TransferRemoteDataSource>()));
  gh.lazySingleton<_i30.TransferUsecase>(() =>
      _i30.TransferUsecase(transferRepositry: get<_i22.TransferRepositry>()));
  gh.lazySingleton<_i31.WithDrawRemoteDataSource>(() =>
      _i31.WithDrawRemoteDataSourceImpl(
          networkInfo: get<_i18.NetworkInfo>(), dio: get<_i14.Dio>()));
  gh.lazySingleton<_i32.WithdrawProvider>(() =>
      _i32.WithdrawProvider(withDrawUseCase: get<_i22.WithDrawUseCase>()));
  gh.lazySingleton<_i22.WithdrawRepository>(() => _i33.WithdrawRepositoryImpl(
      withDrawRemoteDataSource: get<_i22.WithDrawRemoteDataSource>()));
  gh.lazySingleton<_i34.AllAccountRemoteDataSource>(() =>
      _i34.AllAccountRemoteDataSourceImpl(
          dio: get<_i14.Dio>(), networkInfo: get<_i18.NetworkInfo>()));
  gh.lazySingleton<_i35.AllAccountRepository>(() =>
      _i36.AllAccountRepositoryImpl(
          allAccountRemoteDataSource: get<_i34.AllAccountRemoteDataSource>()));
  gh.lazySingleton<_i37.AllAccountUseCase>(() => _i37.AllAccountUseCase(
      allAccountRepository: get<_i35.AllAccountRepository>()));
  gh.lazySingleton<_i38.AllUsersProvider>(
      () => _i38.AllUsersProvider(allUsersUseCase: get<_i7.AllUsersUseCase>()));
  gh.lazySingleton<_i39.AllUsersRemoteDataSource>(() =>
      _i39.AllUsersRemoteDataSourceImpl(
          dio: get<_i14.Dio>(), networkInfo: get<_i18.NetworkInfo>()));
  gh.lazySingleton<_i40.AuthRemoteDataSource>(() =>
      _i40.AuthRemoteDataSourceImpl(
          networkInfo: get<_i18.NetworkInfo>(), dio: get<_i14.Dio>()));
  gh.lazySingleton<_i41.WithDrawUseCase>(() =>
      _i41.WithDrawUseCase(withdrawRepository: get<_i22.WithdrawRepository>()));
  return get;
}

class _$RegisterModule extends _i42.RegisterModule {}
