import 'package:akt_token/feature/akt_token/data/model/data_model.dart';
import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  final Data cryptosTop;
  final Data tokensTop;
  final Data cryptos;
  final Data tokens;

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
