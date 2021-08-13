import 'dart:convert';

import 'package:akt_token/feature/akt_token/data/model/crypto_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../core/error/exception.dart';

abstract class FakeApiDataSource {
  Future<Crypto> getCryptoData();
}

class FakeApiDataSourceImpl implements FakeApiDataSource {
  @override
  Future<Crypto> getCryptoData() =>
      _getCryptoDataFromJsonFile("assets/json/fakeData.json");

  Future<Crypto> _getCryptoDataFromJsonFile(String asset) async {
    var jsonString = await rootBundle.loadString(asset);
    await Future.delayed(Duration(seconds: 2));
    if (jsonString.isNotEmpty) {
      return Crypto.fromJson(json.decode(jsonString));
    } else {
      throw AssetException();
    }
  }
}
