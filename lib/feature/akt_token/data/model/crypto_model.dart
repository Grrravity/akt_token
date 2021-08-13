import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';

class Crypto extends CryptoEntity {
  Crypto(
      {required cryptosTop,
      required tokensTop,
      required cryptos,
      required tokens})
      : super(
            cryptosTop: cryptosTop,
            tokensTop: tokensTop,
            cryptos: cryptos,
            tokens: tokens);

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
        cryptosTop: json['cryptosTop'] != null
            ? new Crypto.fromJson(json['cryptosTop'])
            : null,
        tokensTop: json['tokensTop'] != null
            ? new Crypto.fromJson(json['tokensTop'])
            : null,
        cryptos: json['cryptos'] != null
            ? new Crypto.fromJson(json['cryptos'])
            : null,
        tokens: json['tokens'] != null
            ? new Crypto.fromJson(json['tokens'])
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'cryptosTop': cryptosTop,
      'tokensTop': tokensTop,
      'cryptos': cryptos,
      'tokens': tokens,
    };
  }
}
