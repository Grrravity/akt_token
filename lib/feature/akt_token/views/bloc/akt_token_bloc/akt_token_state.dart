import 'package:akt_token/feature/akt_token/domain/entities/crypto_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AktTokenState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreatingView extends AktTokenState {}

class Loading extends AktTokenState {}

class Fetching extends AktTokenState {}

class Loaded extends AktTokenState {
  final CryptoEntity data;

  Loaded({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends AktTokenState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
