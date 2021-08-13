import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/crypto_entity.dart';

abstract class CryptoDataRepository {
  Future<Either<Failure, CryptoEntity>> getCryptoData();
}
