// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as i14;
import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as i15;
import 'package:shared_preferences/shared_preferences.dart' as i19;

import 'app/view/widgets/app_popup_loader.dart' as i8;
import 'core/local_data_storage/local_data_storage.dart' as i16;
import 'core/network/network_info.dart' as i18;
import 'core/utils/custom_form_validation.dart' as i13;
import 'features/auth/auth.dart' as i10;
import 'features/auth/data/datasources/auth_remote_data_sources.dart' as i40;
import 'features/auth/data/repository/auth_repository_implementation.dart'
    as i12;
import 'features/auth/domain/repositories/auth_repository.dart' as i11;
import 'features/auth/domain/usecases/login_usecase.dart' as i17;
import 'features/auth/domain/usecases/signup_usecases.dart' as i20;
import 'features/auth/presentation/provider/auth_provider.dart' as i9;
import 'features/features.dart' as i22;
import 'features/home/data/data.dart' as i6;
import 'features/home/data/datasources/accounts_remote_data_source.dart' as i34;
import 'features/home/data/datasources/transaction_remote_data_source.dart'
    as i23;
import 'features/home/data/datasources/users_remote_data_source.dart' as i39;
import 'features/home/data/repository/accounts_repository_implementation.dart'
    as i36;
import 'features/home/data/repository/transaction_repository_implementation.dart'
    as i25;
import 'features/home/data/repository/users_repository_implementation.dart'
    as i5;
import 'features/home/domain/domain.dart' as i4;
import 'features/home/domain/repositories/account_repository.dart' as i35;
import 'features/home/domain/usecases/account_usecase.dart' as i37;
import 'features/home/domain/usecases/transaction_usecase.dart' as i26;
import 'features/home/domain/usecases/users_usecase.dart' as i7;
import 'features/home/home.dart' as i24;
import 'features/home/presentation/provider/account_provider.dart' as i3;
import 'features/home/presentation/provider/transaction_provider.dart' as i21;
import 'features/home/presentation/provider/users_provider.dart' as i38;
import 'features/transfer/data/data_sources/transfer_remote_data_sources.dart'
    as i28;
import 'features/transfer/data/repositories/transfer_repositries_implementation.dart'
    as i29;
import 'features/transfer/domain/usecase/transfer_usecase.dart' as i30;
import 'features/transfer/presentation/provider/transfer_provider.dart' as i27;
import 'features/withdraw/data/datasources/withdraw_remote_datasource.dart'
    as i31;
import 'features/withdraw/data/repository/withdraw_repository_implementation.dart'
    as i33;
import 'features/withdraw/domain/usecases/withdraw_usecase.dart' as i41;
import 'features/withdraw/presentation/provider/withdraw_provider.dart' as i32;
import 'register_module.dart' as i42; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
i1.GetIt $initGetIt(i1.GetIt get,
    {String? environment, i2.EnvironmentFilter? environmentFilter}) {
  final gh = i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<i3.AllAccountProvider>(() =>
      i3.AllAccountProvider(allAccountUseCase: get<i4.AllAccountUseCase>()));
  gh.lazySingleton<i4.AllUsersRepository>(() => i5.AlluserRepositoryImpl(
      allUsersRemoteDataSource: get<i6.AllUsersRemoteDataSource>()));
  gh.lazySingleton<i7.AllUsersUseCase>(() =>
      i7.AllUsersUseCase(allUsersRepository: get<i4.AllUsersRepository>()));
  gh.lazySingleton<i8.AppPopups>(() => i8.AppPopups());
  gh.lazySingleton<i9.AuthProvider>(() => i9.AuthProvider(
      signUpUseCase: get<i10.SignUpUseCase>(),
      loginUseCase: get<i10.LoginUseCase>()));
  gh.lazySingleton<i11.AuthRepository>(
      () => i12.AuthRepositpryImpl(get<i10.AuthRemoteDataSource>()));
  gh.lazySingleton<i13.CustomFormValidation>(() => i13.CustomFormValidation());
  gh.factory<i14.Dio>(() => registerModule.dio);
  gh.factory<i15.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<i16.LocalDataStorage>(() => i16.LocalDataStorageImpl());
  gh.lazySingleton<i17.LoginUseCase>(
      () => i17.LoginUseCase(authRepository: get<i11.AuthRepository>()));
  gh.lazySingleton<i18.NetworkInfo>(
      () => i18.NetworkInfoImpl(get<i15.InternetConnectionChecker>()));
  gh.factoryAsync<i19.SharedPreferences>(() => registerModule.prefs);
  gh.lazySingleton<i20.SignUpUseCase>(
      () => i20.SignUpUseCase(authRepository: get<i11.AuthRepository>()));
  gh.lazySingleton<i21.TransactionProvider>(() => i21.TransactionProvider(
      transactionUseCase: get<i22.TransactionUseCase>()));
  gh.lazySingleton<i23.TransactionRemoteDataSource>(() =>
      i23.TransactionRemoteDataSourceImpl(
          networkInfo: get<i18.NetworkInfo>(), dio: get<i14.Dio>()));
  gh.lazySingleton<i24.TransactionRepository>(() =>
      i25.TransactionRepositpryImpl(get<i24.TransactionRemoteDataSource>()));
  gh.lazySingleton<i26.TransactionUseCase>(() =>
      i26.TransactionUseCase(authRepository: get<i24.TransactionRepository>()));
  gh.lazySingleton<i27.TransferProvider>(
      () => i27.TransferProvider(transferUsecase: get<i22.TransferUsecase>()));
  gh.lazySingleton<i28.TransferRemoteDataSource>(() =>
      i28.TransferRemoteDataSourceImpl(
          networkInfo: get<i18.NetworkInfo>(), dio: get<i14.Dio>()));
  gh.lazySingleton<i22.TransferRepositry>(
      () => i29.TransferRepositoryImpl(get<i22.TransferRemoteDataSource>()));
  gh.lazySingleton<i30.TransferUsecase>(() =>
      i30.TransferUsecase(transferRepositry: get<i22.TransferRepositry>()));
  gh.lazySingleton<i31.WithDrawRemoteDataSource>(() =>
      i31.WithDrawRemoteDataSourceImpl(
          networkInfo: get<i18.NetworkInfo>(), dio: get<i14.Dio>()));
  gh.lazySingleton<i32.WithdrawProvider>(
      () => i32.WithdrawProvider(withDrawUseCase: get<i22.WithDrawUseCase>()));
  gh.lazySingleton<i22.WithdrawRepository>(() => i33.WithdrawRepositoryImpl(
      withDrawRemoteDataSource: get<i22.WithDrawRemoteDataSource>()));
  gh.lazySingleton<i34.AllAccountRemoteDataSource>(() =>
      i34.AllAccountRemoteDataSourceImpl(
          dio: get<i14.Dio>(), networkInfo: get<i18.NetworkInfo>()));
  gh.lazySingleton<i35.AllAccountRepository>(() => i36.AllAccountRepositoryImpl(
      allAccountRemoteDataSource: get<i34.AllAccountRemoteDataSource>()));
  gh.lazySingleton<i37.AllAccountUseCase>(() => i37.AllAccountUseCase(
      allAccountRepository: get<i35.AllAccountRepository>()));
  gh.lazySingleton<i38.AllUsersProvider>(
      () => i38.AllUsersProvider(allUsersUseCase: get<i7.AllUsersUseCase>()));
  gh.lazySingleton<i39.AllUsersRemoteDataSource>(() =>
      i39.AllUsersRemoteDataSourceImpl(
          dio: get<i14.Dio>(), networkInfo: get<i18.NetworkInfo>()));
  gh.lazySingleton<i40.AuthRemoteDataSource>(() => i40.AuthRemoteDataSourceImpl(
      networkInfo: get<i18.NetworkInfo>(), dio: get<i14.Dio>()));
  gh.lazySingleton<i41.WithDrawUseCase>(() =>
      i41.WithDrawUseCase(withdrawRepository: get<i22.WithdrawRepository>()));
  return get;
}

class _$RegisterModule extends i42.RegisterModule {}
