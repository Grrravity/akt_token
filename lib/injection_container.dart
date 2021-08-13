import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'feature/akt_token/data/repository/crypto_data_repository_impl.dart';
import 'feature/akt_token/data/source/fake_api_datasource.dart';
import 'feature/akt_token/domain/repositories/crypto_repository.dart';
import 'feature/akt_token/domain/usecase/get_crypto_data.dart';
import 'feature/akt_token/views/bloc/akt_token_bloc/akt_token_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - AKT Token App

  //Bloc
  sl.registerFactory(() => AktTokenBloc(cryptoData: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetCryptoData(sl()));

  //Repository
  sl.registerLazySingleton<CryptoDataRepository>(
    () => CryptoDataRepositoryImpl(
      fakeApiDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data Source
  sl.registerLazySingleton<FakeApiDataSource>(() => FakeApiDataSourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
