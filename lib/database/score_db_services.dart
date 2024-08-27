import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slicer/models/scoremodel.dart';

ValueNotifier<List<GameScoreModel>> scoreNotifier=ValueNotifier([]);

class ScoreDbServices {
  Future<void> save(GameScoreModel score) async
  {
    var box=await Hive.openBox<GameScoreModel>('scores');
   await box.add(score);
   await box.close();
  }
  Future<void> getAllScores ()async
  {
    var box=await Hive.openBox<GameScoreModel>('scores');
    scoreNotifier.value.clear();
    scoreNotifier.value.addAll(box.values);
    scoreNotifier.value.sort((a, b) => b.score.compareTo(a.score),);
    await box.close();
  }
}