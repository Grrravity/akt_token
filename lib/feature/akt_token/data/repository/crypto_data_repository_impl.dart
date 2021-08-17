import 'package:akt_token/feature/akt_token/data/source/fake_api_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/crypto_entity.dart';
import '../../domain/repositories/crypto_repository.dart';

class CryptoDataRepositoryImpl implements CryptoDataRepository {
  final FakeApiDataSource fakeApiDataSource;
  final NetworkInfo networkInfo;

  CryptoDataRepositoryImpl({
    required this.fakeApiDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CryptoEntity>> getCryptoData() async {
    return await _getCryptoData();
  }

  /// Getting data from the fake datasource (json file)
  /// @return [Crypto] or [LocalFailure]
  Future<Either<Failure, CryptoEntity>> _getCryptoData() async {
    //Check connectivity and load ressources from api or cache
    //TODO add remote and local source
    if (await networkInfo.isConnected) {
      try {
        final cryptoData = await fakeApiDataSource.getCryptoData();
        return Right(cryptoData);
      } on AssetException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cryptoData = await fakeApiDataSource.getCryptoData();
        return Right(cryptoData);
      } on AssetException {
        return Left(LocalFailure());
      }
    }
  }
}
