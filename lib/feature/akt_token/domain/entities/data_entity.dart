import 'package:equatable/equatable.dart';

class DataEntity extends Equatable {
  final int id;
  final String name;
  final double amount;
  final double percentage;
  final String background;
  final double transparency;

  DataEntity(
      {required this.id,
      required this.name,
      required this.amount,
      required this.percentage,
      required this.background,
      required this.transparency});

  @override
  List<Object> get props => [
        id.toString(),
        name,
        amount.toString(),
        percentage.toString(),
        background,
        transparency.toString()
      ];
}
