import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AktTokenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewCreation extends AktTokenEvent {}

class PromotionPressed extends AktTokenEvent {}

class TokenPressed extends AktTokenEvent {}

class CryptoPressed extends AktTokenEvent {}
