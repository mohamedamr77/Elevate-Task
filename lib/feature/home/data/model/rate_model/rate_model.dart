import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'rate_model.g.dart';

@HiveType(typeId: 1)
class Rating extends Equatable {
  @HiveField(0)
  final double rate;
  @HiveField(1)
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  @override
  List<Object?> get props => [rate, count];
}
