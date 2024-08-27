import 'package:hive_flutter/hive_flutter.dart';
part 'scoremodel.g.dart';

@HiveType(typeId: 1)
class GameScoreModel extends HiveObject {
  @HiveField(0)
  final int score;
  @HiveField(1)
  final DateTime date;

  GameScoreModel({required this.score, required this.date});
}
