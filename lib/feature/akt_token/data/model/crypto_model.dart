import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';

import 'data_model.dart';

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
        cryptosTop: json['cryptos_top'] != null
            ? List<Data>.from(json['cryptos_top'].map((x) => Data.fromJson(x)))
            : null,
        tokensTop: json['tokens_top'] != null
            ? List<Data>.from(json['tokens_top'].map((x) => Data.fromJson(x)))
            : null,
        cryptos: json['cryptos'] != null
            ? List<Data>.from(json['cryptos'].map((x) => Data.fromJson(x)))
            : null,
        tokens: json['tokens'] != null
            ? List<Data>.from(json['tokens'].map((x) => Data.fromJson(x)))
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'cryptos_top': cryptosTop,
      'tokens_top': tokensTop,
      'cryptos': cryptos,
      'tokens': tokens,
    };
  }
}
