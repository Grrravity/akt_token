import 'package:akt_token/feature/akt_token/data/model/data_model.dart';
import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  final List<Data> cryptosTop;
  final List<Data> tokensTop;
  final List<Data> cryptos;
  final List<Data> tokens;

  CryptoEntity(
      {required this.cryptosTop,
      required this.tokensTop,
      required this.cryptos,
      required this.tokens});

  @override
  List<Object> get props => [
        cryptosTop.toString(),
        tokensTop.toString(),
        cryptos.toString(),
        tokens.toString()
      ];
}
