import 'dart:async';

import 'package:bloc/bloc.dart';

import './akt_token_export_bloc.dart';
import '../../../domain/usecase/get_crypto_data.dart';

class AktTokenBloc extends Bloc<AktTokenEvent, AktTokenState> {
  final GetCryptoData getcryptoData;

  AktTokenBloc({required GetCryptoData cryptoData})
      : getcryptoData = cryptoData,
        super(CreatingView());

  @override
  Stream<AktTokenState> mapEventToState(
    AktTokenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
