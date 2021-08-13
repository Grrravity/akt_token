import 'package:akt_token/core/error/failure.dart';
import 'package:akt_token/core/usecase/usecase.dart';
import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';
import 'package:akt_token/feature/akt_token/domain/repositories/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class GetCryptoData implements UseCase<CryptoEntity, NoParams> {
  final CryptoDataRepository repository;

  GetCryptoData(this.repository);

  @override
  Future<Either<Failure, CryptoEntity>> call(NoParams params) async {
    return await repository.getCryptoData();
  }
}
