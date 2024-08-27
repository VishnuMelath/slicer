import 'dart:async';
import 'dart:developer';
import 'package:flame/components.dart';
import 'package:slicer/game/game.dart';
import 'package:slicer/game/sprites/enemy.dart';

import 'sprites/player.dart';

class SlicerWorld extends World with HasGameRef<TestGame> {
  double fallval = 10;
  int count = 0;
  int level=1;
  int i=1;
  late final Player player;
  late final Enemy enemy;
  @override
  FutureOr<void> onLoad() {
     log('game height : ${gameRef.size.y} \n game width : ${gameRef.size.x} ');
    player = Player();
    super.onLoad();
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    count++;
    calculateLevel(count);
    if (count % 100 == 0) {
      fallval += 1;
     addFire();
    }
   
  }

  void calculateLevel(int count) {
    for (; i <= count; i=i*10) {
      level++;
      
    }

  }

  void addFire()
  async{
    for(int j=0;j<level;j++)
    { var enemy1 = Enemy(fallVal: fallval);
      enemy1.position.x = enemy1.moveHorizontally((count * 10).toDouble());
    await  Future.delayed(const Duration(seconds: 1));
      add(enemy1);
    }
  }
}
