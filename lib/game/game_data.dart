import 'package:flutter/material.dart';

class GameData {
  static ValueNotifier<int> score=ValueNotifier(0);
  static ValueNotifier<int> life=ValueNotifier(3);
  static ValueNotifier<bool> pauseMenu=ValueNotifier(false);
 static reset()
  {
    score.value=0;
    life.value=3;
  }
} 