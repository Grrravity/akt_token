import 'dart:async';

import 'package:akt_token/core/error/failure.dart';
import 'package:akt_token/core/usecase/usecase.dart';
import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import './akt_token_export_bloc.dart';
import '../../../domain/usecase/get_crypto_data.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Local Failure';
const String INVALID_DATA_FAILURE_MESSAGE =
    'Invalid data - the asset provided must return token and crypto data';

class AktTokenBloc extends Bloc<AktTokenEvent, AktTokenState> {
  final GetCryptoData getCryptoData;

  AktTokenBloc({required GetCryptoData cryptoData})
      : getCryptoData = cryptoData,
        super(CreatingView());

  @override
  Stream<AktTokenState> mapEventToState(
    AktTokenEvent event,
  ) async* {
    if (event is ViewCreation) {
      yield Loading();
      final failureOrData = await getCryptoData(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrData);
    }
  }

  Stream<AktTokenState> _eitherLoadedOrErrorState(
    Either<Failure, CryptoEntity> failureOrData,
  ) async* {
    yield failureOrData.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (data) => Loaded(data: data),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case LocalFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
