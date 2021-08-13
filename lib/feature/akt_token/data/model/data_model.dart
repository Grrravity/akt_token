import 'package:akt_token/feature/akt_token/domain/entities/data_entity.dart';

class Data extends DataEntity {
  Data(
      {required id,
      required name,
      required amount,
      required percentage,
      required background,
      required transparency})
      : super(
            id: id,
            name: name,
            amount: amount,
            percentage: percentage,
            background: background,
            transparency: transparency);

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      name: json['name'] ?? "Unknown name",
      amount: json['amount'] ?? 0.00,
      percentage: json['percentage'] ?? 0.00,
      background: json['background'] ?? "ffffff",
      transparency: json['transparency'] ?? 0.00,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'percentage': percentage,
      'background': background,
      'transparency': transparency,
    };
  }
}
