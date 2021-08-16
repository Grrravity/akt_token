import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AktTokenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ViewCreation extends AktTokenEvent {}

class SalesPressed extends AktTokenEvent {}

class ItemPressed extends AktTokenEvent {}
